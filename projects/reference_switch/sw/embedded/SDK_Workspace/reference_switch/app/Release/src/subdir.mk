################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/helloworld.c \
../src/iic_config.c \
../src/iic_pm.c \
../src/iic_si5324.c \
../src/platform.c 

OBJS += \
./src/helloworld.o \
./src/iic_config.o \
./src/iic_pm.o \
./src/iic_si5324.o \
./src/platform.o 

C_DEPS += \
./src/helloworld.d \
./src/iic_config.d \
./src/iic_pm.d \
./src/iic_si5324.d \
./src/platform.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O2 -c -fmessage-length=0 -MT"$@" -I../../bsp/control_sub_i_nf_mbsys_mbsys_microblaze_0/include -mlittle-endian -mcpu=v10.0 -mxl-soft-mul -Wl,--no-relax -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

