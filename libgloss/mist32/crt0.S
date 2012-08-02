# mist32 startup code

	.section .text
	.global	_start
_start:
	
	;; Initialise the stack pointer
	lih	r0, hi(_stack)
	wl16	r0, lo(_stack)
	srspw	r0
	move	rbase, r0
	
	;; Clear the BSS.  Do it in two parts for efficiency:
	;; longwords first for most of it, then the remaining 0 to 3 bytes.

	lih	r2, hi(__bss_start)
	wl16	r2, lo(__bss_start) ; R2 = start of BSS
	lih	r3, hi(__bss_start)
	wl16	r3, lo(__bss_start) ; R3 = end of BSS + 1

	sub	r3, r2		; R3 = BSS size in bytes
	move	r4, r3
	shl	r4, 2		; R4 = BSS size in longwords (rounded down)
	clr	r1		; clear R1 for longword store

	cmp	r4, 0
	br	2f, #eq		; any more to go?

1:	
	st32	r1, r2
	add	r2, 4
	sub	r4, 1
	cmp	r4, 0
	br	1b, #ne
	
2:
	lil	r4, 0x3		; get no. of remaining BSS bytes to clear
	and 	r3, r4
	cmp	r3, 0
	br	4f, #eq
3:
	st8	r1, r2
	add	r2, 1
	sub	r3, 1
	cmp	r4, 0
	br	3b, #ne
4:

	;; Run code in the .init section.
	;; This will queue the .fini section to be run with atexit.
	b	__init, #al

	;; Call main, then exit.
	b	main, #al
	b	exit, #al

	;; If that fails just loop.
1:
	br	1b, #al

