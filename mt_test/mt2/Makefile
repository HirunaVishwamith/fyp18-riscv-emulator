TOP=../
include $(TOP)/Make.rules

LDLIBS=-lc -lgcc
CFLAGS+=-O

LDFLAGS+=-Wl,--no-relax
#LDFLAGS+=-Wl,-Tdata=0x1000
LDFLAGS+=-Wl,-Tdata=0x1600

### Only for mt2
# LDFLAGS += -lpthread
CFLAGS += -std=c++11


PROGS=prog prog.bin prog.lst 

all:: $(PROGS)

# prog: main.o
prog: crt0.o
	$(LINK.c) -o $@ $^ $(LDLIBS)
	$(SIZE) -A -x $@

clean::
	rm -f $(PROGS) *.o *.s *.lst *.bin *.srec

# .PHONY: run
# run: prog.bin
# 	../../../src/rvddt -l0x3000 -f prog.bin
