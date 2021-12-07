IDIR=/usr/include/libdwarf
IDIR=/var/tmp/libdwarf-20210528/libdwarf
LDIR=/usr/lib/
LDIR=/var/tmp/bld/src/lib/libdwarf/.libs
LDIR=/var/tmp/libdwarf-20210528/libdwarf/.libs
CC=gcc
CFLAGS=-O2 -g -I$(IDIR) -L$(LDIR)
CFLAGS=-O2 -gdwarf-5 -I$(IDIR) -L$(LDIR)
LDFLAGS= 
LIBNAME=libdwarf.a

LIBS=$(LDIR)/$(LIBNAME) -lelf -lz


addr2line: addr2line.o 
	$(CC) -o $@  $<  $(CFLAGS) $(LDFLAGS) $(LIBS)
addr2line.o: addr2line.c
	$(CC) -c $<  $(CFLAGS) 

.PHONY: clean run

check: addr2line
	./addr2line -a -e test/addr2line.o  0x13f
	./addr2line -a -e test/dwarf5addr2line.o  0xdd5 0xdf1 

clean:
	rm -f *~
	rm -f addr2line
	rm -f addr2line.o
