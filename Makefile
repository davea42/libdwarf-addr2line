IDIR=/usr/include/libdwarf
IDIR=/var/tmp/libdwarf-20210528/libdwarf
LDIR=/usr/lib/
LDIR=/var/tmp/bld/src/lib/libdwarf/.libs
LDIR=/var/tmp/libdwarf-20210528/libdwarf/.libs
CC=gcc
CFLAGS=-O2 -g -I$(IDIR) -L$(LDIR)
LDFLAGS= 
LIBNAME=libdwarf.a

LIBS=$(LDIR)/$(LIBNAME) -lelf -lz
addr2line: addr2line.c
	$(CC) -o $@ $<  $(CFLAGS) $(LDFLAGS) $(LIBS)

.PHONY: clean run

run: addr2line
	./addr2line -a -e addr2line  0x1510 0x1511

clean:
	rm -f *~
	rm -f addr2line
