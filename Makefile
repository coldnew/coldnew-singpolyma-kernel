
SRCS = main.c
OBJS = $(patsubst %.c, %.o, $(SRCS))
TARGET = kernel.bin

CROSS_COMPILE = arm-none-eabi

CC = $(CROSS_COMPILE)-gcc
LD = $(CROSS_COMPILE)-ld
AS = $(CROSS_COMPILE)-as

CFLAGS = -march=armv6 -msoft-float
CFLAGS += -Os -Wall -Wall -Wextra -fPIC -nostartfiles
LDFLAGS = -N -Ttext=0x10000

all : $(OBJS)
	$(CC) $(CFLAGS) $(SRCS) -o $(TARGET)

%.o : %.c
	$(CC) $(CFLAGS) -c $<

qemu : all
	qemu-system-arm -M versatilepb -cpu arm1176  -kernel $(TARGET)

clean:
	$(RM) -rf $(OBJS) $(TARGET)