global outb
global inb

outb:
    mov al, [esp + 8]   ; data
    mov dx, [esp + 4]   ; port
    out dx, al
    ret

inb:
    mov dx, [esp + 4]   ; port
    in al, dx
    ret
