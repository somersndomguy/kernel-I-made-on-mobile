# Makefile for Kernel From Scratch (Direct LLD i386 link)

CC = clang
CFLAGS = --target=i386-elf -ffreestanding -fno-pie -fno-stack-protector -fno-builtin -mno-red-zone -O2

all: kfs.bin

kfs.bin: boot.o halt.o io.o kernel.o keyboard.o mem.o linker.ld
	ld.lld -m elf_i386 -T linker.ld -o kfs.bin boot.o halt.o io.o kernel.o keyboard.o mem.o

boot.o: boot.s
	nasm -f elf32 boot.s -o boot.o

halt.o: halt.s
	nasm -f elf32 halt.s -o halt.o

io.o: io.s
	nasm -f elf32 io.s -o io.o

kernel.o: kernel.c
	$(CC) $(CFLAGS) -c kernel.c -o kernel.o

keyboard.o: keyboard.c
	$(CC) $(CFLAGS) -c keyboard.c -o keyboard.o

mem.o: mem.c
	$(CC) $(CFLAGS) -c mem.c -o mem.o

run: kfs.bin
	qemu-system-i386 -kernel kfs.bin

clean:
	rm -f *.o kfs.bin
