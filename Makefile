IDIR=/usr/include/libdwarf
IDIR=/var/tmp/libdwarf-20210528/libdwarf
LDIR=/usr/lib/
LDIR=/var/tmp/bld/src/lib/libdwarf/.libs
LDIR=/var/tmp/libdwarf-20210528/libdwarf/.libs
CC=gcc
CFLAGS=-O2 -g -I$(IDIR) -L$(LDIR)
LDFLAGS= 
LIBNAME=libdwarf.a

ODIR=obj
LIBS=$(LDIR)/$(LIBNAME) -lelf -lz

_OBJ = addr2line.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

addr2line: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS) $(LIBS)

.PHONY: clean run

run: addr2line
	#./addr2line -a -e a.out 0x1510 0x1511
	./addr2line -a -e $(OBJ)  0x1510 0x1511



clean:
	rm -f $(ODIR)/*.o *~

$(shell mkdir -p $(ODIR))
