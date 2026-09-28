#ifndef MEM_H
#define MEM_H

#include <stddef.h>
#include <stdint.h>

// Initialize the memory manager with a starting heap address
void memory_init(uint32_t start_address);

// Allocate a block of memory of a given size
void* kmalloc(size_t size);

// Basic free stub (bump allocators expand forward, but we keep the signature ready)
void kfree(void* ptr);

#endif

