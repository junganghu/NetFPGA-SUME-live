/*-
 * Copyright (c) 2015 Bjoern A. Zeeb
 * All rights reserved.
 *
 * This software was developed by SRI International and the University of
 * Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249
 * ("MRC2"), as part of the DARPA MRC research programme.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 * $Id: sume.c,v 1.34 2015/06/24 22:32:12 root Exp root $
 */
/*
 * This work was licensed to NetFPGA C.I.C. (NetFPGA) under
 * one or more contributor license agreements (CLA).  Changes to this work
 * can only be accepted from contributors with a valid CLA in place.
 * See http://www.netfpga-cic.org for more information.
 */

/*
 * A couple of notes on this very early stage, basic driver interacting with
 * the RIFFA DMA engine (more comments inline).
 * We are currently using two channels:  channel 0 is for the data streams of
 * all four NIC ports;  channel 1 is for register access.   Ideally the latter
 * would not go through 2 DMA transactions per register access but there would
 * be a 2nd BAR for this.  However adding that BAR to RIFFA seems like a
 * Sisyphean task (volunteers welcome).
 * There is currently no way to disable interrupt generation with RIFFA, so
 * we try to deal with this as much as we can in software, especially during
 * initialisation when we can get interrupts before having allocated all
 * resources, which would immediately lead to an Ooops.  Also going into
 * polling mode is kind of hard that way.
 * Each packet is a dedicated DMA transaction setting the "last" flag of
 * RIFFA, not doing an more complicated packet batching to reduce overhead.
 * RIFFA does not provide us with descriptor rings and there can always only
 * be one outstanding transaction per channel and direction at a given time.
 * DMA transactions need to be 32bit aligned with RIFFA.  This makes it
 * impossible to DMA to 16bit offsets.  Work is in progress to be able to
 * deal with packet data which is 32bit aligned on the L3 header, having an
 * extra 16bit 0x0000 between the 128bit meta-information and the start of
 * the Ethernet header.  Meanwhile we are using a single hardwired bounce
 * buffer in each direction and copy the data over, which means it is always
 * only one (the same) S/G list entry.  Once the 16bit spacing is in place
 * this can go and we expect performance to improve due to avoiding the extra
 * memory copy, DMAing directly to/from the SKB data area.
 */

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/types.h>
#include <linux/pci.h>
#include <linux/errno.h>
#include <linux/netdevice.h>
#include <linux/etherdevice.h>
#include <linux/interrupt.h>
#include <linux/sysctl.h>

#include "nf_sume.h"

#define	DRIVER_NAME		"sume_riffa"
#define	DRIVER_NAME_DESCR	"NetFPGA SUME (RIFFA DMA)"
#define	DRIVER_VERSION		"$Revision: 1.34 $"

/*
 * The SUME cards have assigned Ethernet addresses as bar code labels
 * on the SFP cages but they are not stored anywhere software readable
 * on the card.   One could imagine to have a program to write them into
 * flash in the future using a simple program so that drivers could
 * read them from there.  For now the user has to set them and meanwhile
 * we provide a (call it whatever you want) default very much like early
 * NF10 did.
 */
#define	DEFAULT_ETHER_ADDRESS	"\02SUME\00"

/* Allow the default number of ports to be set at compile time. */
#ifndef SUME_PORTS_MAX
#define	SUME_PORTS_MAX	4
#endif
/* Allow the number of ports being controlled at load time. */
static unsigned int sume_nports __read_mostly = SUME_PORTS_MAX;
module_param(sume_nports, uint, 0644);
MODULE_PARM_DESC(sume_nports, "Number of Ethernets ports supported");

#define	DEFAULT_MSG_ENABLE	(NETIF_MSG_DRV|NETIF_MSG_PROBE|\
    NETIF_MSG_LINK|NETIF_MSG_IFDOWN|NETIF_MSG_IFUP)
static unsigned int sume_debug = -1;
module_param(sume_debug, uint, 0600);
MODULE_PARM_DESC(sume_debug, "Debug level; see NETIF_MSG_* in "
    "Documentation/networking/netif-msg.txt");

#ifndef SUME_16B_OFFSET
#define	SUME_16B_OFFSET		0
#endif
static unsigned int sume_16boff __read_mostly = SUME_16B_OFFSET;
module_param(sume_16boff, uint, 0644);
MODULE_PARM_DESC(sume_16boff, "Set to 1 for for 16bit packet offset support.");

/* Currently SUME only uses two fixed channels for all port traffic and regs. */
#define	SUME_RIFFA_CHANNEL_DATA(sp)	0
#define	SUME_RIFFA_CHANNEL_REG(sp)	1	/* See description at top. */
#define	SUME_RIFFA_CHANNELS(sp)		2

/* Device names. */
#define	SUME_ETH_DEVICE_NAME		"nf%d"

/* Watchdog timeout. */
#define	TX_WATCHDOG			(5 * HZ)

/* RIFFA constants. */
#define	RIFFA_MAX_CHNLS			12
#define	RIFFA_MAX_BUS_WIDTH_PARAM	4
#define	RIFFA_SG_BUF_SIZE		(4*1024)
#define	RIFFA_SG_ELEMS			200

/* RIFFA register offsets. */
#define	RIFFA_RX_SG_LEN_REG_OFF		0x0
#define	RIFFA_RX_SG_ADDR_LO_REG_OFF	0x1
#define	RIFFA_RX_SG_ADDR_HI_REG_OFF	0x2
#define	RIFFA_RX_LEN_REG_OFF		0x3
#define	RIFFA_RX_OFFLAST_REG_OFF	0x4
#define	RIFFA_TX_SG_LEN_REG_OFF		0x5
#define	RIFFA_TX_SG_ADDR_LO_REG_OFF	0x6
#define	RIFFA_TX_SG_ADDR_HI_REG_OFF	0x7
#define	RIFFA_TX_LEN_REG_OFF		0x8
#define	RIFFA_TX_OFFLAST_REG_OFF	0x9
#define	RIFFA_INFO_REG_OFF		0xA
#define	RIFFA_IRQ_REG0_OFF		0xB
#define	RIFFA_IRQ_REG1_OFF		0xC
#define	RIFFA_RX_TNFR_LEN_REG_OFF	0xD
#define	RIFFA_TX_TNFR_LEN_REG_OFF	0xE

#define	RIFFA_CHNL_REG(c, o)		((c << 4) + o)

/*
 * RIFFA state machine;
 * rather than using complex circular buffers for 1 transaction.
 */
#define	SUME_RIFFA_CHAN_STATE_IDLE	0x01
#define	SUME_RIFFA_CHAN_STATE_READY	0x02
#define	SUME_RIFFA_CHAN_STATE_READ	0x04
#define	SUME_RIFFA_CHAN_STATE_LEN	0x08

#define	SUME_CHAN_STATE_RECOVERY_FLAG	0x80000000

/* Various bits and pieces. */
#define	SUME_RIFFA_MAGIC		0xcafe

/* Accessor macros. */
#define	SUME_RIFFA_LAST(offlast)	((offlast) & 0x01)
#define	SUME_RIFFA_OFFSET(offlast)	\
    ((unsigned long long)((offlast) >> 1) << 2)
#define	SUME_RIFFA_LEN(len)		((unsigned long long)(len) << 2)

#define	SUME_RIFFA_SG_LO_ADDR(sg)	(sg_dma_address(sg) & 0xffffffff);
#define	SUME_RIFFA_SG_HI_ADDR(sg)	\
    ((sg_dma_address(sg) >> 32) & 0xffffffff);
#define	SUME_RIFFA_SG_LEN(sg)		(sg_dma_len(sg) >> 2)	/* Words. */

/* LOCK support. */
#define	SUME_GLOBAL_LOCK	1
#ifdef SUME_GLOBAL_LOCK
#define	SUME_LOCK(adapter, flags)					\
    spin_lock_irqsave(&adapter->lock, flags);
#define	SUME_UNLOCK(adapter, flags)					\
    spin_unlock_irqrestore(&adapter->lock, flags);

#define	SUME_LOCK_RX(adapter, i, flags)
#define	SUME_UNLOCK_RX(adapter, i, flags)
#define	SUME_LOCK_TX(adapter, i, flags)
#define	SUME_UNLOCK_TX(adapter, i, flags)

#else /* !SUME_GLOBAL_LOCK */
#define	SUME_LOCK(adapter, flags)
#define	SUME_UNLOCK(adapter, flags)

#define	SUME_LOCK_RX(adapter, i, flags)					\
    spin_lock_irqsave(&adapter->recv[i]->lock, flags);
#define	SUME_UNLOCK_RX(adapter, i, flags)				\
    spin_unlock_irqrestore(&adapter->recv[i]->lock, flags);
#define	SUME_LOCK_TX(adapter, i, flags)					\
    spin_lock_irqsave(&adapter->send[i]->lock, flags);
#define	SUME_UNLOCK_TX(adapter, i, flags)				\
    spin_unlock_irqrestore(&adapter->send[i]->lock, flags);
#endif

/*
 * Sysctl infrastructure is currently only used to control some
 * printfs for debugging purposes.
 */
static unsigned int sume_debug_level;

static struct ctl_table sume_table[] = {
	{
		.procname	= "debug_level",
		.data		= &sume_debug_level,
		.maxlen		= sizeof(sume_debug_level),
		.mode		= 0644,
		.proc_handler	= proc_dointvec
	},
	{ }
};

static struct ctl_table sume_dir_table[] = {
	{
		.procname	= DRIVER_NAME,
		.mode		= 0555,
		.child		= sume_table
	},
	{ }
};

static struct ctl_table sume_root_table[] = {
	{
		.procname	= "dev",
		.mode		= 0555,
		.child		= sume_dir_table
	},
	{ }
};

static struct ctl_table_header *sume_table_header;

static int __init
sume_init_sysctl(void)
{

	sume_table_header = register_sysctl_table(sume_root_table);
	if (!sume_table_header)
		return (-ENOMEM);
	return (0);
}

static void
sume_exit_sysctl(void)
{

	unregister_sysctl_table(sume_table_header);
}

/*
 * Attempt of an overview of data structure linkage:
 * -----------------------------------------------------------------------------
 *
 * "hw adapter":  struct sume_adapter
 * +-> struct netdev **		/ Memory allocated for sume_nports with adapter.
 * +-> riffa*			/ We will use a single channel and multiplex
 * |				/ based on "TUSER" s/dport metadata from the
 * |				/ beginning of the DMA transaction, and not
 * |				/ have a channel (or two) per port, thus this
 * |				/ ends up on the single adapter and not in port.
 * +-> ...
 *
 * Note:
 * There is no forward pointer to each "port" structure in the adapter.
 * You get that information by accessing the netdev private data for port <n>,
 * e.g., struct sume_port *port = netdev_priv(adapter->netdev[port]);
 *
 *
 * "port": struct sume_port
 * +-> adapter			/ Backpointer to the hw adapter.
 * +-> netdev			/ Pointer to "our" netdev.
 * +-> port			/ Our port number <0..ume_nports-1>.
 * +-> napi			/ XXX Once we would support it.
 *
 * Note:
 * This structure is allocated using the alloc_etherdev() [alloc_netdev()]
 * function and thus ends up being the per-port/driver "private" data for each
 * adapter.   Use netdev_priv() to extract this based on the port's netdev.
 */

struct riffa_chnl_dir {
	void				*buf_addr;	/* S/G addresses+len. */
	dma_addr_t			buf_hw_addr;	/* -- " -- mapped. */
	int				num_sg;
#ifndef SUME_GLOBAL_LOCK
	spinlock_t			lock;
#endif
	wait_queue_head_t		waitq;
	unsigned int			state;
	unsigned int			flags;
	unsigned int			offlast;
	unsigned int			len;		/* words */
	unsigned int			rtag;
	uint32_t			*bouncebuf;
	size_t				bouncebuf_len;
};

struct sume_adapter {
	struct pci_dev			*pdev;
	struct net_device		**netdev;

	char				name[32];

	/* RIFFA. */
	struct riffa_chnl_dir		**recv;
	struct riffa_chnl_dir		**send;
	void __iomem			*bar0;
	unsigned long long		bar0_addr;
	unsigned long long		bar0_len;
	unsigned long long		bar0_flags;
	atomic_t			running;
	atomic_t			intr_in_progress;
	void				*spill_buf_addr;
	dma_addr_t			spill_buf_hw_addr;
	int				num_sg;
	int				sg_buf_size;
	int				id;
	int				num_chnls;
#ifdef SUME_GLOBAL_LOCK
	spinlock_t			lock;
#endif
};

struct sume_port {
	struct sume_adapter		*adapter;
	struct net_device		*netdev;
	struct napi_struct		napi;
	unsigned int			port;
	unsigned int			port_up;
	unsigned int			msg_enable;
	unsigned int			riffa_channel;
};

/* Prototypes. */
static irqreturn_t sume_intr_handler(int, void *);

/* Register read/write wrapper functons. */
static inline unsigned int
read_reg(struct sume_adapter *adapter, int offset)
{

	return (readl(adapter->bar0 + (offset << 2)));
}

static inline void
write_reg(struct sume_adapter *adapter, int offset, unsigned int val)
{

	writel(val, adapter->bar0 + (offset << 2));
}

/* Helper functions. */
static int
sume_riffa_fill_sg_buf(struct sume_adapter *adapter,
    struct riffa_chnl_dir *p, enum dma_data_direction dir,
    unsigned long long len)
{
	struct scatterlist sgl, *sg;
	uint32_t *sgtablep;
	unsigned long long len_rem;
	int i, num_sg;

	num_sg = 0;
	len_rem = len;

	if (len > 0) {
		unsigned long long l;

		l = (len_rem > p->bouncebuf_len) ? p->bouncebuf_len : len_rem;
		len_rem -= l;

		/* We just use the one hard coded bounce buffer for now. */
		sg_init_table(&sgl, 1);
		sg_set_buf(&sgl, p->bouncebuf, l);
		num_sg = dma_map_sg(&adapter->pdev->dev, &sgl, 1, dir);
		sgtablep = p->buf_addr;
		if (num_sg > adapter->num_sg) {
			printk(KERN_INFO "%s: num_sg(%d) exceeds adapter->"
			    "num_sg(%d).\n", __func__, num_sg, adapter->num_sg);
			/* XXX-BZ recover? */
		}
		for_each_sg(&sgl, sg, num_sg, i) {
			sgtablep[(i * 4) + 0] = SUME_RIFFA_SG_LO_ADDR(sg);
			sgtablep[(i * 4) + 1] = SUME_RIFFA_SG_HI_ADDR(sg);
			sgtablep[(i * 4) + 2] = SUME_RIFFA_SG_LEN(sg);
		}
	} else {
		/* Really nothing we need to do, right? */
	}

	/* Remember the number of segments. */
	p->num_sg = num_sg;

	return (0);
}

/* Interface transitioned to UP status. */
static int
sume_open(struct net_device *netdev)
{
	struct sume_port *sume_port;

	sume_port = netdev_priv(netdev);
	sume_port->port_up = 1;
	netif_start_queue(netdev);

	netif_info(sume_port, ifup, netdev, "up\n");

	return (0);
}

/* Interface transitioned to DOWN status. */
static int sume_stop(struct net_device *netdev)
{
	struct sume_port *sume_port;

	sume_port = netdev_priv(netdev);
	netif_stop_queue(netdev);
	sume_port->port_up = 0;

	netif_info(sume_port, ifdown, netdev, "down\n");

	return (0);
}

/* Packet to transmit. */
static netdev_tx_t
sume_start_xmit(struct sk_buff *skb, struct net_device *netdev)
{
	struct sume_adapter *adapter;
	struct sume_port *sume_port;
	uint32_t *p32;
	uint16_t *p16, sport, dport;
	unsigned long flags;
	int error, i, last, offset;

	/*
	 * Currently [some SUME/NF10 converter block] cannot handle
	 * payload with less than 256 bits.
	 */
#if 0
	if (unlikely(skb->len <= 32)) {
		dev_kfree_skb_any(skb);
		netdev->stats.tx_dropped++;
		return (NETDEV_TX_OK);
	}
#else
	/* An easy workaround is to pad the packets to min. Eth. frame len. */
	if (skb_padto(skb, ETH_ZLEN) != 0) {
		netdev->stats.tx_dropped++;
		return (NETDEV_TX_OK);
	}
	/* padto() doesn't update the length, just [allocs] zeros bits. */
	if (skb->len < ETH_ZLEN)
		skb->len = ETH_ZLEN;
#endif

	sume_port = netdev_priv(netdev);
	adapter = sume_port->adapter;
	i = sume_port->riffa_channel;

	SUME_LOCK(adapter, flags);
	SUME_LOCK_TX(adapter, i, flags);

	/*
	 * Check state. It's the best we can do for now.
	 */
	if (adapter->send[i]->state != SUME_RIFFA_CHAN_STATE_IDLE) {
		netdev->stats.tx_dropped++;
		SUME_UNLOCK_TX(adapter, i, flags);
		SUME_UNLOCK(adapter, flags);
#if 0
		printk(KERN_INFO "%s: ch %d not in IDLE state (%d).\n",
		    __func__, i, adapter->send[i]->state);
#endif
		kfree_skb(skb);
		return (NETDEV_TX_OK);
	}
	/* Clear the recovery flag. */
	adapter->send[i]->flags &= ~SUME_CHAN_STATE_RECOVERY_FLAG;

	/*
	 * XXX-BZ Going through the bounce buffer in that direction is kind
	 * of stupid but KISS for now;  should check alignment and only
	 * bounce if needed.
	 */
	/* Make sure we fit with the 16 bytes metadata. */
	if ((skb->len + 16) > adapter->send[i]->bouncebuf_len) {
		netdev->stats.tx_dropped++;
		SUME_UNLOCK_TX(adapter, i, flags);
		SUME_UNLOCK(adapter, flags);
		printk(KERN_INFO "%s: Packet too big for bounce buffer (%d)\n",
		    __func__, skb->len);
		kfree_skb(skb);
		return (NETDEV_TX_OK);
	}

	/* Skip the first 4 * sizeof(uint32_t) bytes for the metadata. */
	skb_copy_from_linear_data(skb, (adapter->send[i]->bouncebuf) + 4,
	    skb->len);
	adapter->send[i]->len = 4;		/* words */
	adapter->send[i]->len += (skb->len / 4) + ((skb->len % 4 == 0) ? 0 : 1);

	/* Fill in the metadata. */
	p16 = (uint16_t *)adapter->send[i]->bouncebuf;
	p32 = (uint32_t *)adapter->send[i]->bouncebuf;
	sport = 1 << (sume_port->port * 2 + 1);	/* CPU(DMA) ports are odd. */
	dport = 1 << (sume_port->port * 2);	/* MAC ports are even. */
	*p16++ = cpu_to_le16(sport);
	*p16++ = cpu_to_le16(dport);
	*p16++ = cpu_to_le16(skb->len);
	*p16++ = cpu_to_le16(SUME_RIFFA_MAGIC);
	*(p32 + 2) = cpu_to_le32(0);	/* Timestamp. */
	*(p32 + 3) = cpu_to_le32(0);	/* Timestamp. */

	/* Let the FPGA know about the transfer. */
	offset = 0;
	last = 1;
	write_reg(adapter, RIFFA_CHNL_REG(i, RIFFA_RX_OFFLAST_REG_OFF),
	    ((offset << 1) | (last & 0x01)));
	write_reg(adapter, RIFFA_CHNL_REG(i, RIFFA_RX_LEN_REG_OFF),
	    adapter->send[i]->len);		/* words */

	/* Fill the S/G map. */
	error = sume_riffa_fill_sg_buf(adapter,
	    adapter->send[i], DMA_TO_DEVICE,
	    SUME_RIFFA_LEN(adapter->send[i]->len));
	if (error != 0) {
		netdev->stats.tx_dropped++;
		SUME_UNLOCK_TX(adapter, i, flags);
		SUME_UNLOCK(adapter, flags);
		printk(KERN_INFO "%s: failed to map S/G buffer\n", __func__);
		kfree_skb(skb);
		return (NETDEV_TX_OK);
	}

	/* Update the state before intiating the DMA to avoid races. */
	adapter->send[i]->state = SUME_RIFFA_CHAN_STATE_READY;

	/* DMA. */
	write_reg(adapter, RIFFA_CHNL_REG(i, RIFFA_RX_SG_ADDR_LO_REG_OFF),
	    (adapter->send[i]->buf_hw_addr & 0xFFFFFFFF));
	write_reg(adapter, RIFFA_CHNL_REG(i, RIFFA_RX_SG_ADDR_HI_REG_OFF),
	    ((adapter->send[i]->buf_hw_addr >> 32) & 0xFFFFFFFF));
	write_reg(adapter, RIFFA_CHNL_REG(i, RIFFA_RX_SG_LEN_REG_OFF),
	    4 * adapter->send[i]->num_sg);

#if 0
	netdev_sent_queue(netdev, skb->len);
	skb_tx_timestamp(skb);
#endif

	netdev->stats.tx_packets++;
	netdev->stats.tx_bytes += skb->len;

	SUME_UNLOCK_TX(adapter, i, flags);
	SUME_UNLOCK(adapter, flags);

	/* We can free as long as we use the bounce buffer. */
	/*
	 * XXX-BZ otherwise we should once we unmap and call
	 * netdev_completed_queue().
	 */
	dev_kfree_skb_any(skb);

	return (NETDEV_TX_OK);
}

/* Allow Ethernet address to be changed. */
static int
sume_set_mac_address(struct net_device *netdev, void *p)
{
	struct sockaddr *addr = p;

	if (!is_valid_ether_addr(addr->sa_data))
		return (-EADDRNOTAVAIL);

	memcpy(netdev->dev_addr, addr->sa_data, netdev->addr_len);

	return (0);
}

/* Register read/write. */
static int
sume_reg_wr_locked(struct sume_adapter *adapter, int i)
{
	int error, last, offset;

	/* Let the FPGA know about the transfer. */
	offset = 0;
	last = 1;
	write_reg(adapter, RIFFA_CHNL_REG(i, RIFFA_RX_OFFLAST_REG_OFF),
	    ((offset << 1) | (last & 0x01)));
	write_reg(adapter, RIFFA_CHNL_REG(i, RIFFA_RX_LEN_REG_OFF),
	    adapter->send[i]->len);		/* words */

	/* Fill the S/G map. */
	error = sume_riffa_fill_sg_buf(adapter,
	    adapter->send[i], DMA_TO_DEVICE,
	    SUME_RIFFA_LEN(adapter->send[i]->len));
	if (error != 0) {
		printk(KERN_INFO "%s: failed to map S/G buffer\n", __func__);
		return (-EFAULT);
	}

	/* Update the state before intiating the DMA to avoid races. */
	adapter->send[i]->state = SUME_RIFFA_CHAN_STATE_READY;

	/* DMA. */
	write_reg(adapter, RIFFA_CHNL_REG(i, RIFFA_RX_SG_ADDR_LO_REG_OFF),
	    (adapter->send[i]->buf_hw_addr & 0xFFFFFFFF));
	write_reg(adapter, RIFFA_CHNL_REG(i, RIFFA_RX_SG_ADDR_HI_REG_OFF),
	    ((adapter->send[i]->buf_hw_addr >> 32) & 0xFFFFFFFF));
	write_reg(adapter, RIFFA_CHNL_REG(i, RIFFA_RX_SG_LEN_REG_OFF),
	    4 * adapter->send[i]->num_sg);

	return (0);
}

/*
 * Request a register read or write (depending on strb).
 * If strb is set (0x1f) this will result in a register write,
 * otherwise this will result in a register read request at the given
 * address and the result will need to be DMAed back.
 */
static int
sume_initiate_reg_write(struct sume_port *sume_port, struct sume_ifreq *sifr,
    uint32_t strb)
{
	struct sume_adapter *adapter;
	uint32_t *p32;
	unsigned long flags;
	int error, i;

	adapter = sume_port->adapter;

	/*
	 * 1. Make sure the channel is free;  otherwise return EBUSY.
	 * 2. Prepare the memory in the bounce buffer (which we always
	 *    use for regs).
	 * 3. Start the DMA process.
	 * 4. Sleep and wait for result and return success or error.
	 */
	i = SUME_RIFFA_CHANNEL_REG(sume_port);
	SUME_LOCK(adapter, flags);
	SUME_LOCK_TX(adapter, i, flags);

	if (adapter->send[i]->state != SUME_RIFFA_CHAN_STATE_IDLE) {
		SUME_UNLOCK_TX(adapter, i, flags);
		SUME_UNLOCK(adapter, flags);
		return (-EBUSY);
	}

	p32 = (uint32_t *)adapter->send[i]->bouncebuf;
	*p32++ = cpu_to_le32(sifr->addr);
	*p32++ = cpu_to_le32(sifr->val);
	/* Tag to indentify request. */
	*p32++ = cpu_to_le32(++adapter->send[i]->rtag);
	*p32 = cpu_to_le32(strb);		/* This is STRB; write a val. */
	adapter->send[i]->len = 4;		/* words */

	error = sume_reg_wr_locked(adapter, i);
	if (error != 0) {
		SUME_UNLOCK_TX(adapter, i, flags);
		SUME_UNLOCK(adapter, flags);
		return (-EFAULT);
	}

	/*
	 * We have to drop the lock to void deadlocks. I wish Linux had versions
	 * like sleep(9) on BSD, which take the mtx, so we can check under lock.
	 */
	SUME_UNLOCK_TX(adapter, i, flags);
	SUME_UNLOCK(adapter, flags);

	/* Timeout after 1s. */
	error = wait_event_interruptible_timeout(adapter->send[i]->waitq,
	    adapter->send[i]->state == SUME_RIFFA_CHAN_STATE_LEN, HZ);

	/* This was a write so we are done; were interrupted, or timed out. */
	if (strb != 0x00 || error == 0 || error == -ERESTARTSYS) {
		SUME_LOCK(adapter, flags);
		SUME_LOCK_TX(adapter, i, flags);
		adapter->send[i]->state = SUME_RIFFA_CHAN_STATE_IDLE;
		SUME_UNLOCK_TX(adapter, i, flags);
		SUME_UNLOCK(adapter, flags);
		if (strb == 0x00)
			error = -ERESTARTSYS;
		else
			error = 0;
	} else
		error = 0;
	/*
	 * For read requests we will update state once we are done
	 * having read the result to avoid any two outstanding
	 * transactions, or we need a queue and validate tags,
	 * which is a lot of work for a low priority, infrequent
	 * event.
	 */

	return (error);
}

static int
sume_read_reg_result(struct sume_port *sume_port, struct sume_ifreq *sifr)
{
	struct sume_adapter *adapter;
	uint32_t *p32;
	unsigned long flags;
	int error, i;

	adapter = sume_port->adapter;

	/*
	 * 0. Sleep waiting for result if needed (unless condition is
	 *    true already).
	 * 2. Read DMA results.
	 * 3. Update state on *TX* to IDLE to allow next read to start.
	 */
	i = SUME_RIFFA_CHANNEL_REG(sume_port);

	/* We only need to be woken up at the end of the transaction. */
	/* Timeout after 1s. */
	error = wait_event_interruptible_timeout(adapter->recv[i]->waitq,
	    adapter->recv[i]->state == SUME_RIFFA_CHAN_STATE_READ, HZ);
	if (error == 0 || error == -ERESTARTSYS) {
		printk(KERN_WARNING "%s: wait error: %d\n", __func__, error);
		return (-ERESTARTSYS);
	}

	SUME_LOCK(adapter, flags);
	SUME_LOCK_RX(adapter, i, flags);

	/*
	 * Read reply data and validate address and tag.
	 * Note: we do access the send side without lock but the state
	 * machine does prevent the data from changing.
	 */
	p32 = (uint32_t *)adapter->recv[i]->bouncebuf;
#if 0
	/* We cannot validate as the address is always 0x0000_0000. */
	if (le32_to_cpu(*p32) != sifr->addr) {
		printk(KERN_WARNING "%s: addr error: 0x%08x 0x%08x\n", __func__,
		    le32_to_cpu(*p32), sifr->addr);
	}
#endif
	if (le32_to_cpu(*(p32+2)) != adapter->send[i]->rtag) {
		printk(KERN_WARNING "%s: rtag error: 0x%08x 0x%08x\n", __func__,
		    le32_to_cpu(*(p32+2)), adapter->send[i]->rtag);
	}
	sifr->val = le32_to_cpu(*(p32+1));
#if 0
	(*p32 >> 5) & 0x03;		/* Response STRB? */
#endif
	adapter->recv[i]->state = SUME_RIFFA_CHAN_STATE_IDLE;
	SUME_UNLOCK_RX(adapter, i, flags);

	/* We are done. */
	SUME_LOCK_TX(adapter, i, flags);
	adapter->send[i]->state = SUME_RIFFA_CHAN_STATE_IDLE;
	SUME_UNLOCK_TX(adapter, i, flags);
	SUME_UNLOCK(adapter, flags);

	return (0);
}

/* Non-generic ioctl handler. */
static int
sume_do_ioctl(struct net_device *netdev, struct ifreq *ifr, int cmd)
{
	struct sume_port *sume_port;
	struct sume_ifreq sifr;
	int error;

	sume_port = netdev_priv(netdev);
	if (sume_port == NULL || sume_port->adapter == NULL)
		return (-EINVAL);

	error = 0;
	switch (cmd) {
	case SUME_IOCTL_CMD_WRITE_REG:
		error = copy_from_user(&sifr, ifr->ifr_data, sizeof(sifr));
		if (error != 0) {
			error = -EFAULT;
			break;
		}

		error = sume_initiate_reg_write(sume_port, &sifr, 0x1f);
		break;
	case SUME_IOCTL_CMD_READ_REG:
		error = copy_from_user(&sifr, ifr->ifr_data, sizeof(sifr));
		if (error != 0) {
			error = -EFAULT;
			break;
		}

		error = sume_initiate_reg_write(sume_port, &sifr, 0x00);
		if (error != 0)
			break;

		error = sume_read_reg_result(sume_port, &sifr);
		if (error != 0)
			break;

		error = copy_to_user(ifr->ifr_data, &sifr, sizeof(sifr));
		if (error != 0)
			error = -EFAULT;
		break;
	default:
#ifdef DEBUG
		printk("%s: unsupported ioctl 0x%08x\n", __func__, cmd);
#endif
		error = -EOPNOTSUPP;
		break;
	}

	return (error);
}

/* Allow user to change the interface MTU. */
static int
sume_change_mtu(struct net_device *netdev, int new_mtu)
{

	/*
	 * XXX-BZ we should make sure it is not larger than
	 * what our bounce buffer can deal with.
	 */
	return (0);
}

/* Callback when the TX side went on watchdog time vacation. */
static void
sume_tx_timeout(struct net_device *netdev)
{

}

/* Statistics.  Everyone likes numbers. */
static struct rtnl_link_stats64 *
sume_get_stats64(struct net_device *netdev, struct rtnl_link_stats64 *storage)
{

#define	COPY_STAT(field)						\
	storage->field = netdev->stats.field

	COPY_STAT(rx_packets);
	COPY_STAT(tx_packets);
	COPY_STAT(rx_bytes);
	COPY_STAT(tx_bytes);
	COPY_STAT(rx_errors);
	COPY_STAT(tx_errors);
	COPY_STAT(rx_dropped);
	COPY_STAT(multicast);
	COPY_STAT(collisions);
	COPY_STAT(tx_dropped);

	COPY_STAT(rx_length_errors);
	COPY_STAT(rx_over_errors);
	COPY_STAT(rx_crc_errors);
	COPY_STAT(rx_frame_errors);
	COPY_STAT(rx_fifo_errors);
	COPY_STAT(rx_missed_errors);

	COPY_STAT(tx_aborted_errors);
	COPY_STAT(tx_carrier_errors);
	COPY_STAT(tx_fifo_errors);
	COPY_STAT(tx_heartbeat_errors);
	COPY_STAT(tx_window_errors);

	COPY_STAT(rx_compressed);
	COPY_STAT(tx_compressed);
#undef	COPY_STAT

	return (storage);
}

#ifdef CONFIG_NET_POLL_CONTROLLER
static void
sume_poll_controller(struct net_device *netdev)
{
	struct sume_port *sume_port;
	struct sume_adapter *adapter;

	sume_port = netdev_priv(netdev);
	adapter = sume_port->adapter;

	/*
	 * XXX-BZ can't call disable/enable_irq with MSI on Linux.  Assume
	 * the msi functions do the right thing.
	 * XXX-BZ but really want to have interrupt generation disabled,
	 * which is currently not possible with RIFFA.
	 */
	pci_disable_msi(adapter->pdev);
	sume_intr_handler(adapter->pdev->irq, adapter);
	pci_enable_msi(adapter->pdev);
}
#endif

static const struct net_device_ops sume_netdev_ops = {
	.ndo_open		= sume_open,
	.ndo_stop		= sume_stop,
	.ndo_start_xmit		= sume_start_xmit,
	.ndo_set_mac_address	= sume_set_mac_address,
	.ndo_validate_addr	= eth_validate_addr,
	.ndo_do_ioctl		= sume_do_ioctl,
	.ndo_change_mtu		= sume_change_mtu,
	.ndo_tx_timeout		= sume_tx_timeout,
	.ndo_get_stats64	= sume_get_stats64,
#ifdef CONFIG_NET_POLL_CONTROLLER
	.ndo_poll_controller    = sume_poll_controller,
#endif
};

static int
sume_netdev_alloc(struct sume_adapter *adapter, unsigned int port)
{
	struct net_device *netdev;
	struct sume_port *sume_port;

	netdev = alloc_etherdev(sizeof(*sume_port));
	if (netdev == NULL) {
		printk(KERN_INFO "%s: alloc_etherdev failed\n", __func__);
		return (-ENOMEM);
	}

	SET_NETDEV_DEV(netdev, &adapter->pdev->dev);
	netdev->netdev_ops = &sume_netdev_ops;
	netdev->watchdog_timeo = TX_WATCHDOG;
	memcpy(netdev->dev_addr, DEFAULT_ETHER_ADDRESS, ETH_ALEN);
	netdev->dev_addr[ETH_ALEN-1] = port;
	/*
	 * We don't want to call them eth%d.  Sadly no API for this exists
	 * while still trying to use alloc_etherdev().
	 */
	strcpy(netdev->name, SUME_ETH_DEVICE_NAME);

	sume_port = netdev_priv(netdev);
	sume_port->adapter = adapter;
	sume_port->netdev = netdev;
	sume_port->port = port;
	sume_port->msg_enable = netif_msg_init(sume_debug, DEFAULT_MSG_ENABLE);
#if 0
	netif_napi_add(netdev, &port->napi, sume_port_poll, NAPI_WEIGHT);
#endif
	sume_port->riffa_channel = SUME_RIFFA_CHANNEL_DATA(sume_port);

	adapter->netdev[port] = netdev;

	/* XXX-BZ in theory we can only call netif_info() after register. */
	netif_info(sume_port, probe, netdev, "Port %u Ethernet address %pM\n",
	    sume_port->port,  netdev->dev_addr);

	/* Keep it off until we registered it. */
	netif_carrier_off(netdev);

	return (0);
}

/* Linux should really have this wrapper function. */
static int __inline
netdev_registered(struct net_device *dev)
{

	return (dev->reg_state == NETREG_REGISTERED);
}

static void
sume_free_netdevs(struct sume_adapter *adapter)
{
	int i;

	for (i = 0; i < sume_nports; i++) {
		if (adapter->netdev[i] == NULL)
			continue;
		if (netdev_registered(adapter->netdev[i])) {
			/* XXX-BZ  No link-state access, thus force it down. */
			netif_carrier_off(adapter->netdev[i]);
			unregister_netdev(adapter->netdev[i]);
		}
		free_netdev(adapter->netdev[i]);
	}
}

static void
sume_unregister_netdevs(struct sume_adapter *adapter)
{
	int i;

	for (i = 0; i < sume_nports; i++) {
		if (adapter->netdev[i] == NULL)
			continue;
		if (netdev_registered(adapter->netdev[i]))
			unregister_netdev(adapter->netdev[i]);
	}
}

static int
sume_register_netdevs(struct sume_adapter *adapter)
{
	int error, i;

	for (i = 0; i < sume_nports; i++) {
		if (adapter->netdev[i] == NULL)
			continue;
		error = register_netdev(adapter->netdev[i]);
		if (error) {
			struct sume_port *sume_port;

			sume_port = netdev_priv(adapter->netdev[i]);
			dev_err(&adapter->pdev->dev, "Failed to register net "
			    "device for port %u.\n", sume_port->port);
			return (error);
		}
		/* Not having Link-State information, we force it up. */
		netif_carrier_on(adapter->netdev[i]);
	}

	return (0);
}

static int
sume_rx_build_skb(struct sume_adapter *adapter, int i, unsigned int len)
{
	struct sk_buff *skb;
	struct net_device *netdev;
	struct sume_port *sume_port;
	int np;
	uint32_t t1, t2, *p32;
	uint16_t sport, dport, dp, plen, magic, *p16;

	/* The metadata header is 16 bytes. */
	if (len < 16) {
#if 0
		netdev->stats.rx_length_errors++;
#endif
		printk(KERN_INFO "%s: short frame (%d)\n",
		    __func__, len);
		return (-EINVAL);
	}

	p32 = (uint32_t *)adapter->recv[i]->bouncebuf;
	p16 = (uint16_t *)adapter->recv[i]->bouncebuf;
	sport = le16_to_cpu(*(p16 + 0));
	dport = le16_to_cpu(*(p16 + 1));
	plen =  le16_to_cpu(*(p16 + 2));
	magic = le16_to_cpu(*(p16 + 3));

	t1 = le32_to_cpu(*(p32 + 2));
	t2 = le32_to_cpu(*(p32 + 3));

	if ((16 + sume_16boff * sizeof(uint16_t) + plen) > len ||
	    magic != SUME_RIFFA_MAGIC) {
#if 0
		if ((16 + sume_16boff * sizeof(uint16_t) + plen) > len)
			netdev->stats.rx_length_errors++;
		if (magic != SUME_RIFFA_MAGIC)
			netdev->stats.rx_errors++;
#endif
		printk(KERN_INFO "%s: corrupted packet (16 + %zd + %d > %d || "
		    "magic 0x%04x != 0x%04x)\n", __func__,
		    sume_16boff * sizeof(uint16_t), plen, len, magic,
		    SUME_RIFFA_MAGIC);
#if 0
        {
        uint8_t *p8 = (uint8_t *)adapter->recv[i]->bouncebuf;
        int z;
        printk(KERN_DEBUG "DMA DATA: ");
        for (z = 0; z < len; z++)
          printk(KERN_DEBUG "0x%02x ", *(p8 + z));
        printk(KERN_DEBUG "\n");
        }
#endif
		return (-EINVAL);
	}


#ifndef	NO_SINGLE_PORT_NIC
	/* On the single-port test NIC project s/dport are always 0. */
	if (sport == 0 && dport == 0) {
		np = 0;
	} else
#endif
	{
		np = 0;
		dp = dport & 0xaa;
		while ((dp & 0x2) == 0) {
			np++;
			dp >>= 2;
		}
	}
	if (np > sume_nports) {
#if 0
		netdev->stats.rx_dropped++;
#endif
		printk(KERN_INFO "%s: invalid destination port 0x%04x (%d)\n",
		    __func__, dport, np);
		return (-EINVAL);
	}
	netdev = adapter->netdev[np];

	/* If the interface is down, well, we are done. */
	sume_port = (struct sume_port *)netdev_priv(netdev);
	if (unlikely(sume_port->port_up == 0)) {
		netdev->stats.rx_dropped++;
		return (0);
	}

	skb = netdev_alloc_skb_ip_align(netdev, plen + NET_IP_ALIGN);
	if (skb == NULL) {
		netdev->stats.rx_dropped++;
		/* XXX-BZ use netif_err()? */
		printk(KERN_INFO "%s: failed to allocate skb\n", __func__);
		return (-EINVAL);
	}

	/* Copy the data in at the right offset. */
	skb_copy_to_linear_data_offset(skb, NET_IP_ALIGN,
	    p16 + 8 + sume_16boff, plen);
	/* Set length and tail. */
	skb_put(skb, NET_IP_ALIGN + plen);
	skb->protocol = eth_type_trans(skb, netdev);
	skb->ip_summed = CHECKSUM_NONE;
#if 0
	napi_gro_receive(&adapter->napi, skb);
#else
	netif_rx(skb);
#endif

	netdev->stats.rx_packets++;
	netdev->stats.rx_bytes += plen;

	return (0);
}

static irqreturn_t
sume_intr_handler_process(struct sume_adapter *adapter, unsigned int vect0,
    unsigned int vect1)
{
#ifndef SUME_GLOBAL_LOCK
	unsigned long flags;
#endif
	unsigned int len, vect;
	int error, i, loops;

	/*
	 * We only have one interrupt for all channels and no way
	 * to quickly lookup for which channel(s) we got an interrupt?
	 */
	for (i = 0; i < adapter->num_chnls; i++) {
		if (i < 6)
			vect = vect0;
		else
			vect = vect1;

		SUME_LOCK_TX(adapter, i, flags);
		loops = 0;
		while ((vect & ((1 << ((5 * i) + 3)) | (1 << ((5 * i) + 4)))) &&
		    loops <= 5) {
			if (sume_debug_level)
				printk(KERN_DEBUG "%s: TX ch %d state %u "
				    "vect=0x%08x\n", __func__, i,
				    adapter->send[i]->state, vect);
			switch (adapter->send[i]->state) {
			case SUME_RIFFA_CHAN_STATE_IDLE:
				break;
			case SUME_RIFFA_CHAN_STATE_READY:
				if (vect & (1 << ((5 * i) + 3))) {
					adapter->send[i]->state =
					    SUME_RIFFA_CHAN_STATE_READ;
					vect &= ~(1 << ((5 * i) + 3));
				} else {
					printk(KERN_INFO "%s: ch %d unexpected "
					    "interrupt in send+3 state %u: "
					    "vect=0x%08x\n", __func__,
					    i, adapter->send[i]->state, vect);
					adapter->send[i]->flags |=
					    SUME_CHAN_STATE_RECOVERY_FLAG;
				}
				break;
			case SUME_RIFFA_CHAN_STATE_READ:
				if (vect & (1 << ((5 * i) + 4))) {

					adapter->send[i]->state =
					    SUME_RIFFA_CHAN_STATE_LEN;

					len = read_reg(adapter,
					    RIFFA_CHNL_REG(i,
					    RIFFA_RX_TNFR_LEN_REG_OFF));
					/*
					 * XXX-BZ should compare length with
					 * expected amount of data transfered;
					 * only on match advance state?
					 */
					if (i ==
					    SUME_RIFFA_CHANNEL_DATA(adapter))
						adapter->send[i]->state =
						    SUME_RIFFA_CHAN_STATE_IDLE;
					else if (i ==
					    SUME_RIFFA_CHANNEL_REG(adapter))
						wake_up_interruptible(
						    &adapter->send[i]->waitq);
					else {
						printk(KERN_WARNING "%s: "
						    "interrupt on ch %d "
						    "unexpected in send+4 "
						    "state %u: vect=0x%08x\n",
						    __func__, i,
						    adapter->send[i]->state,
						    vect);
						adapter->send[i]->flags |=
						    SUME_CHAN_STATE_RECOVERY_FLAG;
					}
					vect &= ~(1 << ((5 * i) + 4));
				} else {
					printk(KERN_INFO "%s: ch %d unexpected "
					    "interrupt in send+4 state %u: "
					    "vect=0x%08x\n", __func__,
					    i, adapter->send[i]->state, vect);
					adapter->send[i]->flags |=
					    SUME_CHAN_STATE_RECOVERY_FLAG;
				}
				break;
			case SUME_RIFFA_CHAN_STATE_LEN:
				break;
			default:
				WARN_ON(1);
			}
			loops++;
		}

		if ((vect & ((1 << ((5 * i) + 3)) | (1 << ((5 * i) + 4)))) &&
		    ((adapter->send[i]->flags & SUME_CHAN_STATE_RECOVERY_FLAG)
		    != 0))
			printk(KERN_WARNING "%s: ignoring vect=0x%08x "
			    "during TX; not in recovery; state=%d loops=%d\n",
			    __func__, vect, adapter->send[i]->state, loops);
		SUME_UNLOCK_TX(adapter, i, flags);

		SUME_LOCK_RX(adapter, i, flags);
		loops = 0;
		while ((vect & ((1 << ((5 * i) + 0)) | (1 << ((5 * i) + 1)) |
		    (1 << ((5 * i) + 2)))) && loops < 5) {
			if (sume_debug_level)
				printk(KERN_DEBUG "%s: RX ch %d state %u "
				    "vect=0x%08x\n", __func__, i,
				    adapter->recv[i]->state, vect);
			switch (adapter->recv[i]->state) {
			case SUME_RIFFA_CHAN_STATE_IDLE:
				if (vect & (1 << ((5 * i) + 0))) {
					unsigned long max_ptr;

					/* Clear recovery state. */
					adapter->recv[i]->flags &=
					    ~SUME_CHAN_STATE_RECOVERY_FLAG;

					/* Get offset and length. */
					adapter->recv[i]->offlast = read_reg(
					    adapter, RIFFA_CHNL_REG(i,
					    RIFFA_TX_OFFLAST_REG_OFF));
					adapter->recv[i]->len =
					    read_reg(adapter, RIFFA_CHNL_REG(i,
						RIFFA_TX_LEN_REG_OFF));

					/* Boundary checks. */
					max_ptr = (unsigned long)
					    (adapter->recv[i]->bouncebuf +
					    SUME_RIFFA_OFFSET(
						adapter->recv[i]->offlast) +
					    SUME_RIFFA_LEN(
						adapter->recv[i]->len) - 1);
					if (max_ptr < (unsigned long)
					    adapter->recv[i]->bouncebuf) {
						printk(KERN_INFO "%s: receive "
						    "buffer wrap-around "
						    "overflow.\n", __func__);
						/* XXX-BZ recover? */
					}
					if ((SUME_RIFFA_OFFSET(
					    adapter->recv[i]->offlast) +
					    SUME_RIFFA_LEN(
					    adapter->recv[i]->len)) >
					    adapter->recv[i]->bouncebuf_len) {
						printk(KERN_INFO "%s: receive "
						    "buffer too small.\n",
						    __func__);
						/* XXX-BZ recover? */
					}

					/* Build and load S/G map. */
					error = sume_riffa_fill_sg_buf(adapter,
					    adapter->recv[i], DMA_FROM_DEVICE,
					    SUME_RIFFA_LEN(
					    adapter->recv[i]->len));
					if (error != 0) {
						printk(KERN_INFO "%s: Failed "
						    "to build S/G map.\n",
						    __func__);
						/* XXX-BZ recover? */
					}
					write_reg(adapter,
					    RIFFA_CHNL_REG(i,
						RIFFA_TX_SG_ADDR_LO_REG_OFF),
					    (adapter->recv[i]->buf_hw_addr &
						0xFFFFFFFF));
					write_reg(adapter,
					    RIFFA_CHNL_REG(i,
						RIFFA_TX_SG_ADDR_HI_REG_OFF),
					    ((adapter->recv[i]->buf_hw_addr >>
						32) & 0xFFFFFFFF));
					write_reg(adapter,
					    RIFFA_CHNL_REG(i,
						RIFFA_TX_SG_LEN_REG_OFF),
					    4 * adapter->recv[i]->num_sg);

					adapter->recv[i]->state =
					    SUME_RIFFA_CHAN_STATE_READY;
					vect &= ~(1 << ((5 * i) + 0));
				} else {
					printk(KERN_INFO "%s: ch %d unexpected "
					    "interrupt in recv+0 state %u: "
					    "vect=0x%08x\n", __func__,
					    i, adapter->recv[i]->state, vect);
					adapter->recv[i]->flags |=
					    SUME_CHAN_STATE_RECOVERY_FLAG;
				}
				break;
			case SUME_RIFFA_CHAN_STATE_READY:
				if (vect & (1 << ((5 * i) + 1))) {
					adapter->recv[i]->state =
					    SUME_RIFFA_CHAN_STATE_READ;
					vect &= ~(1 << ((5 * i) + 1));
				} else {
					printk(KERN_INFO "%s: ch %d unexpected "
					    "interrupt in recv+1 state %u: "
					    "vect=0x%08x\n", __func__,
					    i, adapter->recv[i]->state, vect);
					adapter->recv[i]->flags |=
					    SUME_CHAN_STATE_RECOVERY_FLAG;
				}
				break;
			case SUME_RIFFA_CHAN_STATE_READ:
				if (vect & (1 << ((5 * i) + 2))) {
					len = read_reg(adapter,
					    RIFFA_CHNL_REG(i,
						RIFFA_TX_TNFR_LEN_REG_OFF));
					/* XXX-BZ compare to expected len? */

					/*
					 * Remember, len and recv[i]->len
					 * are words.
					 */
					if (i ==
					   SUME_RIFFA_CHANNEL_DATA(adapter)) {
						error = sume_rx_build_skb(
						    adapter, i, len << 2);
						adapter->recv[i]->state =
						    SUME_RIFFA_CHAN_STATE_IDLE;
					} else if (i ==
					    SUME_RIFFA_CHANNEL_REG(adapter)) {
						wake_up_interruptible(
						   &adapter->recv[i]->waitq);
					} else {
						printk(KERN_WARNING "%s: "
						    "interrupt on ch %d "
						    "unexpected in recv+2 "
						    "state %u: vect=0x%08x\n",
						    __func__, i,
						    adapter->recv[i]->state,
						    vect);
						adapter->recv[i]->flags |=
						    SUME_CHAN_STATE_RECOVERY_FLAG;
					}
					vect &= ~(1 << ((5 * i) + 2));

				} else {
					printk(KERN_INFO "%s: ch %d unexpected "
					    "interrupt in recv+2 state %u: "
					    "vect=0x%08x\n", __func__,
					    i, adapter->recv[i]->state, vect);
					adapter->recv[i]->flags |=
					    SUME_CHAN_STATE_RECOVERY_FLAG;
				}
				break;
			case SUME_RIFFA_CHAN_STATE_LEN:
				break;
			default:
				WARN_ON(1);
			}
			loops++;
		}

		if ((vect & ((1 << ((5 * i) + 0)) | (1 << ((5 * i) + 1)) |
		    (1 << ((5 * i) + 2)))) &&
		    ((adapter->recv[i]->flags & SUME_CHAN_STATE_RECOVERY_FLAG)
		    != 0))
			printk(KERN_WARNING "%s: ignoring vect=0x%08x "
			    "during RX; not in recovery; state=%d, loops=%d\n",
			    __func__, vect, adapter->recv[i]->state, loops);
		SUME_UNLOCK_RX(adapter, i, flags);
	}

	return (IRQ_HANDLED);
}

static irqreturn_t
sume_intr_handler(int irq, void *dev_id)
{
	struct sume_adapter *adapter;
#ifdef SUME_GLOBAL_LOCK
	unsigned long flags;
#endif
	unsigned int vect0, vect1;
	int error;

	BUG_ON(dev_id == NULL);
	adapter = (struct sume_adapter *)dev_id;

	/*
	 * Ignore early interrupts from RIFFA given we cannot disable interrupt
	 * generation.
	 */
	if (atomic_read(&adapter->running) == 0)
		return (IRQ_NONE);

	SUME_LOCK(adapter, flags);
	/* XXX-BZ We would turn interrupt generation off. */

	vect0 = read_reg(adapter, RIFFA_IRQ_REG0_OFF);
	WARN_ON((vect0 & 0xC0000000) != 0);		/* XXX-BZ magic number */
	if (adapter->num_chnls > 6) {
		vect1 = read_reg(adapter, RIFFA_IRQ_REG1_OFF);
		WARN_ON((vect1 & 0xC0000000) != 0);	/* XXX-BZ magic number */
	} else
		vect1 = 0;

	error = sume_intr_handler_process(adapter, vect0, vect1);
	SUME_UNLOCK(adapter, flags);
	/* XXX-BZ We would turn interrupt generation back on. */

	return (error);
}

/*
 * Allocate/release RIFFA channel buffer structures.
 */
static int
sume_probe_riffa_buffer(const struct sume_adapter *adapter,
    struct riffa_chnl_dir ***p, const char *dir)
{
	struct riffa_chnl_dir **rp;
	dma_addr_t hw_addr;
	int error, i;

	error = -ENOMEM;
	*p = (struct riffa_chnl_dir **)kzalloc(adapter->num_chnls *
	    sizeof(struct riffa_chnl_dir *), GFP_KERNEL);
	if (*p == NULL) {
		printk(KERN_INFO "%s: kzalloc(%s) failed.\n", __func__, dir);
		return (error);
	}

	rp = *p;
	/* Allocate the chnl_dir structs themselves. */
	for (i = 0; i < adapter->num_chnls; i++) {
		/* One direction. */
		rp[i] = (struct riffa_chnl_dir *)
		    kzalloc(sizeof(struct riffa_chnl_dir), GFP_KERNEL);
		if (rp[i] == NULL) {
			printk(KERN_INFO "%s: kzalloc(%s[%d]) riffa_chnl_dir "
			    "failed.\n", __func__, dir, i);
			return (error);
		}
		rp[i]->buf_addr = pci_alloc_consistent(
		    adapter->pdev, adapter->sg_buf_size, &hw_addr);
		if (rp[i]->buf_addr == NULL) {
			printk(KERN_INFO "%s: pci_alloc_consistent(%s[%d]) "
			    "failed.\n", __func__, dir, i);
			return (error);
		}
		rp[i]->buf_hw_addr = hw_addr;

		/* Allocate the bounce buffer given we need to do 16b shifts. */
		rp[i]->bouncebuf_len = PAGE_SIZE;
		rp[i]->bouncebuf = kzalloc(rp[i]->bouncebuf_len, GFP_KERNEL);
		if (rp[i]->bouncebuf == NULL) {
			printk(KERN_INFO "%s: kzalloc(%s[%d]) bouncebuffer "
			    "failed.\n", __func__, dir, i);
			return (error);
		}

		/* Initialize state. */
#ifndef SUME_GLOBAL_LOCK
		spin_lock_init(&rp[i]->lock);
#endif
		init_waitqueue_head(&rp[i]->waitq);
		rp[i]->rtag = -3;		/* Force early wrap around. */
		rp[i]->state = SUME_RIFFA_CHAN_STATE_IDLE;
	}

	return (0);
}

static int
sume_probe_riffa_buffers(struct sume_adapter *adapter)
{
	int error;

	error = sume_probe_riffa_buffer(adapter, &adapter->recv, "recv");
	if (error != 0)
		return (error);
	error = sume_probe_riffa_buffer(adapter, &adapter->send, "send");
	return (error);
}

static void
sume_remove_riffa_buffer(const struct sume_adapter *adapter,
    struct riffa_chnl_dir **pp)
{
	int i;

	for (i = 0; i < adapter->num_chnls; i++) {

		if (pp[i] == NULL)
			continue;

		/* Wakeup anyone asleep before the waitq goes boom. */
		/* XXX-BZ not really good enough. */
		wake_up_interruptible(&pp[i]->waitq);

		if (pp[i]->bouncebuf != NULL)
			kfree(pp[i]->bouncebuf);

		if (pp[i]->buf_hw_addr != 0) {
			pci_free_consistent(adapter->pdev, adapter->sg_buf_size,
			    pp[i]->buf_addr, (dma_addr_t)(pp[i]->buf_hw_addr));
			pp[i]->buf_hw_addr = 0;
		}

		kfree(pp[i]);
	}
}

static void
sume_remove_riffa_buffers(struct sume_adapter *adapter)
{

	if (adapter->send != NULL) {
		sume_remove_riffa_buffer(adapter, adapter->send);
		kfree(adapter->send);
		adapter->send = NULL;
	}
	if (adapter->recv != NULL) {
		sume_remove_riffa_buffer(adapter, adapter->recv);
		kfree(adapter->recv);
		adapter->recv = NULL;
	}
}

/*
 * Main probe/remove logic.
 */
static void
sume_remove(struct pci_dev *pdev)
{
	struct sume_adapter *adapter;

	adapter = pci_get_drvdata(pdev);
	if (adapter == NULL)
		return;

	sume_exit_sysctl();

	sume_unregister_netdevs(adapter);

	sume_remove_riffa_buffers(adapter);

	free_irq(pdev->irq, adapter);

	pci_disable_msi(pdev);
	pci_release_regions(pdev);
	pci_restore_state(pdev);
	pci_disable_device(pdev);

	if (adapter->bar0 != NULL)
		iounmap(adapter->bar0);

	sume_free_netdevs(adapter);
	kfree(adapter);
}

/*
 * Initialize PCI for RIFFA and run checks that we are operating correctly.
 */
static int
sume_probe_riffa_pci(struct sume_adapter *adapter)
{
	struct pci_dev *pdev;
	uint32_t devctl, devctl2, linkctl;
	unsigned int reg;
	int error;

	pdev = adapter->pdev;

	/* Setup BAR memory regions. */
	error = pci_request_regions(pdev, adapter->name);
	if (error != 0) {
		printk(KERN_INFO "%s: pci_request_regions error %d\n",
		    __func__, error);
		return (error);
	}

	error = -ENODEV;
	/* BAR0. */
	adapter->bar0_addr = pci_resource_start(pdev, 0);
	adapter->bar0_len = pci_resource_len(pdev, 0);
	adapter->bar0_flags = pci_resource_flags(pdev, 0);
	if (adapter->bar0_len != 1024) {	/* XXX-BZ magic number */
		printk(KERN_INFO "%s: bar0_len %llu != 1024\n", __func__,
		    adapter->bar0_len);
		return (error);
	}
	adapter->bar0 = ioremap(adapter->bar0_addr, adapter->bar0_len);
	if (adapter->bar0 == NULL) {
		printk(KERN_INFO "%s: ioremap(%llu, %llu)\n", __func__,
		    adapter->bar0_addr, adapter->bar0_len);
		return (error);
	}

	/* Setup interrupts. */
	error = pci_enable_msi(pdev);
	if (error != 0) {
		printk(KERN_INFO "%s: pci_enable_msi error %d\n",
		    __func__, error);
		return (error);
	}

	error = request_irq(pdev->irq, sume_intr_handler, IRQF_SHARED,
	    adapter->name, adapter);
	if (error != 0) {
		printk(KERN_INFO "%s: request_irq error %d\n", __func__, error);
		return (error);
	}

	/* Extended tag bit. */
	error = pcie_capability_read_dword(pdev, PCI_EXP_DEVCTL, &devctl);
	if (error != 0) {
		printk(KERN_INFO "%s: pcie_capability_read_dword "
		    "PCI_EXP_DEVCTL error %d\n", __func__, error);
		return (error);
	}
	error = pcie_capability_write_dword(pdev, PCI_EXP_DEVCTL,
	    (devctl|PCI_EXP_DEVCTL_EXT_TAG));
	if (error != 0) {
		printk(KERN_INFO "%s: pcie_capability_write_dword "
		    "PCI_EXP_DEVCTL error %d\n", __func__, error);
		return (error);
	}

	/* ID0 bits. */
	error = pcie_capability_read_dword(pdev, PCI_EXP_DEVCTL2, &devctl2);
	if (error != 0) {
		printk(KERN_INFO "%s: pcie_capability_read_dword "
		    "PCI_EXP_DEVCTL2 error %d\n", __func__, error);
		return (error);
	}
	error = pcie_capability_write_dword(pdev, PCI_EXP_DEVCTL2,
	    (devctl2|PCI_EXP_DEVCTL2_IDO_REQ_EN|PCI_EXP_DEVCTL2_IDO_CMP_EN));
	if (error != 0) {
		printk(KERN_INFO "%s: pcie_capability_write_dword "
		    "PCI_EXP_DEVCTL2 error %d\n", __func__, error);
		return (error);
	}

	/* Set RCB to 128. */			/* XXX-BZ magic. */
	error = pcie_capability_read_dword(pdev, PCI_EXP_LNKCTL, &linkctl);
	if (error != 0) {
		printk(KERN_INFO "%s: pcie_capability_read_dword "
		    "PCI_EXP_LNKCTL error %d\n", __func__, error);
		return (error);
	}
	error = pcie_capability_write_dword(pdev, PCI_EXP_LNKCTL,
	    (linkctl|PCI_EXP_LNKCTL_RCB));
	if (error != 0) {
		printk(KERN_INFO "%s: pcie_capability_write_dword "
		    "PCI_EXP_LNKCTL error %d\n", __func__, error);
		return (error);
	}

	/* Read and check device (riffa) configuration. */
	/* XXX This read seems to also trigger a HW state reset? */
	/* XXX-BZ lots of magic numbers to follow. */
	reg = read_reg(adapter, RIFFA_INFO_REG_OFF);
	adapter->num_chnls =	SUME_RIFFA_CHANNELS(reg & 0xf);
	adapter->num_sg =	RIFFA_SG_ELEMS * ((reg >> 19) & 0xf);
	adapter->sg_buf_size =	RIFFA_SG_BUF_SIZE * ((reg >> 19) & 0xf);

	error = -ENODEV;
	/* Check bus master is enabled. */
	if (((reg >> 4) & 0x1) != 1) {
		printk(KERN_INFO "%s: bus master not enabled: %d\n",
		    __func__, ((reg >> 4) & 0x1));
		return (error);
	}
	/* Check link parameters are valid. */
	if (((reg >> 5) & 0x3f) == 0 || ((reg >> 11) & 0x3) == 0) {
		printk(KERN_INFO "%s: link parameters not valid: %d %d\n",
		    __func__, ((reg >> 5) & 0x3f), ((reg >> 11) & 0x3));
		return (error);
	}
	/* Check # of channels are within valid range. */
	if ((reg & 0xf) == 0 || (reg & 0xf) > RIFFA_MAX_CHNLS) {
		printk(KERN_INFO "%s: number of channels out of range: %d\n",
		    __func__, (reg & 0xf));
		return (error);
	}
	/* Check bus width. */
	if (((reg >> 19) & 0xf) == 0 ||
	    ((reg >> 19) & 0xf) > RIFFA_MAX_BUS_WIDTH_PARAM) {
		printk(KERN_INFO "%s: bus width out f range: %d\n",
		    __func__, ((reg >> 19) & 0xf));
		return (error);
	}

	dev_info(&adapter->pdev->dev, "[riffa] # of channels: %d\n",
	    (reg & 0xf));
	dev_info(&adapter->pdev->dev, "[riffa] bus interface width: %d\n",
	    (((reg >> 19) & 0xf) << 5));
	dev_info(&adapter->pdev->dev, "[riffa] bus master enabled: %d\n",
	    ((reg >> 4) & 0x1));
	dev_info(&adapter->pdev->dev, "[riffa] negotiated link width: %d\n",
	    ((reg >> 5) & 0x3f));
	dev_info(&adapter->pdev->dev, "[riffa] negotiated rate width: %d MTs\n",
	    ((reg >> 11) & 0x3) * 2500);
	dev_info(&adapter->pdev->dev, "[riffa] max downstream payload: %d B\n",
	    (128 << ((reg >> 13) & 0x7)));
	dev_info(&adapter->pdev->dev, "[riffa] max upstream payload: %d B\n",
	    (128 << ((reg >> 16) & 0x7)));

	return (0);
}

static int
sume_probe(struct pci_dev *pdev, const struct pci_device_id *id)
{
	struct sume_adapter *adapter;
	int error, i;

	/* Start with the safety check to avoid malfunctions further down. */
	/* XXX-BZ they should bake this informaton into the bitfile. */
	if (sume_nports < 1 || sume_nports > SUME_PORTS_MAX) {
		printk(KERN_INFO "%s: sume_nports out of range: %d (1..%d). "
		    "Using max.\n", __func__, sume_nports, SUME_PORTS_MAX);
		sume_nports = SUME_PORTS_MAX;
	}

	/* Let's get us talking to the RIFFA HW. */
	/* For now we do not need any IO/MEM resources. */
	error = pci_enable_device(pdev);
	if (error != 0) {
		printk(KERN_INFO "%s: pci_enable_device error %d\n",
		    __func__, error);
		return (error);
	}
	pci_set_master(pdev);
	error = pci_save_state(pdev);
	if (error != 0) {
		printk(KERN_INFO "%s: pci_save_state error %d\n",
		    __func__, error);
		return (error);
	}

	error = pci_set_dma_mask(pdev, DMA_BIT_MASK(64));
	if (error != 0) {
		printk(KERN_INFO "%s: pci_set_dma_mask error %d\n",
		    __func__, error);
		goto error_disable_pci;
	}
	error = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
	if (error != 0) {
		printk(KERN_INFO "%s: pci_set_consistent_dma_mask error %d\n",
		    __func__, error);
		goto error_disable_pci;
	}

	/*
	 * We have a special setup given it is one endpoint and multiple
	 * physical network ports on the SUME adapter.
	 * Need to allocate our "hardware" (controller/adapter) structure;
	 * do the first interface and then add the additional <n>.
	 */
	/* Get the adapter memory and link it in; find it in sysfs. */
	error = -ENOMEM;
	adapter = kzalloc(sizeof(*adapter) +
	    sume_nports * sizeof(struct net_device *), GFP_KERNEL);
	if (adapter == NULL) {
		printk(KERN_INFO "%s: kzalloc(adapter) failed\n", __func__);
		goto error_disable_pci;
	}

	adapter->netdev = (struct net_device **)(adapter + 1);
	adapter->pdev = pdev;
#ifdef SUME_GLOBAL_LOCK
	spin_lock_init(&adapter->lock);
#endif
	atomic_set(&adapter->running, 0);
	snprintf(adapter->name, sizeof(adapter->name), "%s %s%d", DRIVER_NAME,
	    pci_name(pdev), PCI_SLOT(pdev->devfn));

	pci_set_drvdata(pdev, adapter);

	/* OK finish up RIFFA. */
	error = sume_probe_riffa_pci(adapter);
	if (error != 0)
		goto error;

	error = sume_probe_riffa_buffers(adapter);
	if (error != 0)
		goto error;

	/* Now do the network interfaces. */
	error = sume_netdev_alloc(adapter, 0);
	if (error != 0)
		goto error;

	for (i = 1; i < sume_nports; i++) {
		error = sume_netdev_alloc(adapter, i);
		if (error != 0)
			goto error;
	}

	error = sume_register_netdevs(adapter);
	if (error != 0)
		goto error;

	/* Register debug sysctls. */
	sume_init_sysctl();

	/* Reset the HW. */
	read_reg(adapter, RIFFA_INFO_REG_OFF);

	/* Ready to go, "enable" IRQ. */
	atomic_set(&adapter->running, 1);

	return (0);

error_disable_pci:
	pci_disable_device(pdev);
	return (error);

error:
	sume_remove(pdev);
	return (error);
}

static void
sume_shutdown(struct pci_dev *dev)
{

}

static const struct pci_device_id sume_id_table[] = {
	{ PCI_DEVICE(PCI_VENDOR_ID_XILINX, 0x7028) },
};

static struct pci_driver sume_driver = {
	.name			= DRIVER_NAME_DESCR,
	.id_table		= sume_id_table,
	.probe			= sume_probe,
	.remove			= sume_remove,
	.shutdown		= sume_shutdown
	/* .err_handler? */
};

/*
 * First thing called when the module is loaded.
 * Do all the one-time driver registration stuff.
 * Everything else will be done in probe.
 */
static int __init
sume_init_module(void)
{
	int error;

	pr_info("%s version %s\n", DRIVER_NAME_DESCR, DRIVER_VERSION);

	/* Register the driver with the PCI subsystem. */
	error = pci_register_driver(&sume_driver);
	return (error);
}

/*
 * Bye bye boom.  Cleanup on module unload.
 */
static void __exit
sume_exit_module(void)
{

	/* Tell the PCI subsystem we are going away. */
	pci_unregister_driver(&sume_driver);
}

module_init(sume_init_module);
module_exit(sume_exit_module);

MODULE_LICENSE("Dual BSD/GPL");	/* GPL v2 only */
MODULE_AUTHOR("Bjoern A. Zeeb <baz21@cam.ac.uk>");
MODULE_DESCRIPTION(DRIVER_NAME_DESCR "network driver");
MODULE_VERSION(DRIVER_VERSION);

/* end */
