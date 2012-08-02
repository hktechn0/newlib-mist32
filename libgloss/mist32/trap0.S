; Trap 0 handler (syscall interface).

	.text
	.global	__trap0
__trap0:
	swi	64		; trap
1:
	br	1b, #al
