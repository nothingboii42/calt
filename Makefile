CC = gcc
CFLAGS = -Wall -Wextra -g -ffreestanding -fno-strict-aliasing -fno-builtin -c

DESTDIR = /
OS := $(shell uname)

all: calt
calt:
	$(CC) $(CFLAGS) calt.c -o calt.o
	ar rcs calt.a calt.o

.PHONY: clean install
clean:
	@rm -fv *.a
	@rm -fv *.o

install:
ifeq ($(OS), Linux)
	@mkdir -pv $(DESTDIR)/usr/include
	@mkdir -pv $(DESTDIR)/usr/lib
	@cp -fv *.h $(DESTDIR)/usr/include
	@cp -fv *.a $(DESTDIR)/usr/lib
else ifeq ($(OS), Darwin)
	@mkdir -pv $(DESTDIR)/usr/include
        @mkdir -pv $(DESTDIR)/usr/lib
        @cp -fv *.h $(DESTDIR)/usr/local/include
        @cp -fv *.a $(DESTDIR)/usr/local/lib
endif
