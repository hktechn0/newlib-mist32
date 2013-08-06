/* crt0.S -- startup file for mist32 */

	.section .text
	.global	_start
	.align	2
_start:
	;; Initialise the stack pointer
	lih	rtmp, hi(_stack)
	wl16	rtmp, lo(_stack)
	srspw	rtmp
	clr	rbase

	;; Clear the BSS.  Do it in two parts for efficiency:
	;; longwords first for most of it, then the remaining 0 to 3 bytes.
	lih	r3, hi(__bss_start__)
	wl16	r3, lo(__bss_start__)	; r3 = start of BSS
	lih	r4, hi(__bss_end__)
	wl16	r4, lo(__bss_end__)	; r4 = end of BSS + 1

	sub	r4, r3		; r4 = BSS size in bytes
	move	r5, r4
	shl	r5, 2		; r5 = BSS size in longwords (rounded down)

	clr	rtmp		; clear rtmp for longword store
	
	cmp	r5, 0
	br	2f, #eq		; any more to go?

	;; Clear BSS in word
1:	
	st32	rtmp, r3	; zero clear
	add	r3, 4		; increment addr in word
	dec	r5, r5		; decrement remaining count
	br	1b, #nz		; any more to go?

	;; Clear BSS in byte
2:
	lil	r5, 0x3		; mask
	and 	r4, r5		; r4 = remaining BSS bytes to clear
	br	4f, #z
3:
	st8	rtmp, r3	; zero clear
	inc	r3, r3		; increment addr
	dec	r4, r4		; decrement remaining count
	br	3b, #nz		; any more to go?

	;; Run code in the .init section.
	;; This will queue the .fini section to be run with atexit.
4:
	lih	rtmp, hi(_init)
	wl16	rtmp, lo(_init)
	movepc	rret, 8
	b	rtmp, #al

	lih	r1, hi(_fini)		; arg[0]
	wl16	r1, lo(_fini)
	lih	rtmp, hi(atexit)
	wl16	rtmp, lo(atexit)
	movepc	rret, 8
	b	rtmp, #al

	;; Call main, then exit.
	lih	rtmp, hi(main)
	wl16	rtmp, lo(main)
	movepc	rret, 8
	b	rtmp, #al
	
	lih	rtmp, hi(exit)
	wl16	rtmp, lo(exit)
	movepc	rret, 8
	b	rtmp, #al

	;; If that fails just loop.
5:
	br	5b, #al
