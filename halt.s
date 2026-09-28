global cpu_halt
cpu_halt:
    cli
.hang:
    hlt
    jmp .hang
