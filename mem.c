#include "mem.h"

// Define a safe default heap start (e.g., 4MB mark, well above your kernel code)
#define HEAP_START_DEFAULT 0x00400000 
#define HEAP_MAX_SIZE      0x01000000 // 16MB pool limit

static uint32_t heap_current = HEAP_START_DEFAULT;
static uint32_t heap_limit = HEAP_START_DEFAULT + HEAP_MAX_SIZE;

void memory_init(uint32_t start_address) {
    if (start_address != 0) {
        heap_current = start_address;
    } else {
        heap_current = HEAP_START_DEFAULT;
    }
    heap_limit = heap_current + HEAP_MAX_SIZE;
}

void* kmalloc(size_t size) {
    // Check for out-of-memory bounds
    if (heap_current + size > heap_limit) {
        return NULL; // Out of memory
    }

    void* ptr = (void*)heap_current;

    // Advance the pointer by the requested size
    heap_current += size;

    // 4-byte alignment enforcement for performance
    if (heap_current % 4 != 0) {
        heap_current = (heap_current + 3) & ~3;
    }

    return ptr;
}

void kfree(void* ptr) {
    // A standard bump allocator doesn't free individual blocks on the fly 
    // unless you implement a free-list or bitmap tracker. 
    // This is kept as a placeholder to prevent linker errors.
    (void)ptr;
}

