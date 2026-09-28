	.syntax	unified
	.eabi_attribute	67, "2.09"	@ Tag_conformance
	.cpu	arm7tdmi
	.eabi_attribute	6, 2	@ Tag_CPU_arch
	.eabi_attribute	8, 1	@ Tag_ARM_ISA_use
	.eabi_attribute	9, 1	@ Tag_THUMB_ISA_use
	.eabi_attribute	34, 0	@ Tag_CPU_unaligned_access
	.eabi_attribute	15, 1	@ Tag_ABI_PCS_RW_data
	.eabi_attribute	16, 1	@ Tag_ABI_PCS_RO_data
	.eabi_attribute	17, 2	@ Tag_ABI_PCS_GOT_use
	.eabi_attribute	20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute	21, 0	@ Tag_ABI_FP_exceptions
	.eabi_attribute	23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute	24, 1	@ Tag_ABI_align_needed
	.eabi_attribute	25, 1	@ Tag_ABI_align_preserved
	.eabi_attribute	38, 1	@ Tag_ABI_FP_16bit_format
	.eabi_attribute	18, 4	@ Tag_ABI_PCS_wchar_t
	.eabi_attribute	26, 2	@ Tag_ABI_enum_size
	.eabi_attribute	14, 0	@ Tag_ABI_PCS_R9_use
	.file	"keyboard.c"
	.text
	.globl	keyboard_handler_main           @ -- Begin function keyboard_handler_main
	.p2align	2
	.type	keyboard_handler_main,%function
	.code	32
keyboard_handler_main:                  @ @keyboard_handler_main
	.fnstart
@ %bb.0:
	.save	{r11, lr}
	push	{r11, lr}
	.setfp	r11, sp
	mov	r11, sp
	mov	r0, #100
	bl	inb
	tst	r0, #1
	beq	.LBB0_4
@ %bb.1:
	mov	r0, #96
	bl	inb
	lsl	r0, r0, #24
	asrs	r0, r0, #24
	bmi	.LBB0_4
@ %bb.2:
	ldr	r1, .LCPI0_0
.LPC0_0:
	add	r1, pc, r1
	ldrb	r0, [r1, r0]
	cmp	r0, #0
	beq	.LBB0_4
@ %bb.3:
	pop	{r11, lr}
	b	terminal_putchar
.LBB0_4:
	pop	{r11, lr}
	bx	lr
	.p2align	2
@ %bb.5:
.LCPI0_0:
	.long	keyboard_map-(.LPC0_0+8)
.Lfunc_end0:
	.size	keyboard_handler_main, .Lfunc_end0-keyboard_handler_main
	.cantunwind
	.fnend
                                        @ -- End function
	.type	keyboard_map,%object            @ @keyboard_map
	.data
	.globl	keyboard_map
keyboard_map:
	.ascii	"\000\0331234567890-=\b\tqwertyuiop[]\n\000asdfghjkl;'`\000\\zxcvbnm,./\000*\000 \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000-\000\000\000+"
	.zero	50
	.size	keyboard_map, 128

	.ident	"clang version 21.1.8"
	.section	".note.GNU-stack","",%progbits
