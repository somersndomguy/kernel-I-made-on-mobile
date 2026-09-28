# isr.s - Interrupt Service Routines for PS/2 Keyboard

.global keyboard_handler_assembly
.extern keyboard_handler_main

# Read a byte from a hardware port
.global outb
.type outb, @function
outb:
    mov 4(%esp), %al
    mov 8(%esp), %dx
    out %al, %dx
    ret

# Write a byte to a hardware port
.global inb
.type inb, @function
inb:
    mov 4(%esp), %dx
    in %dx, %al
    ret

# Wrapper for the keyboard interrupt (IRQ1 / Interrupt 33)
keyboard_handler_assembly:
    pusha
    call keyboard_handler_main
    popa
    iret

