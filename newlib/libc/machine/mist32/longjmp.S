# longjmp for mist32
	
	.text
	.global	_longjmp
_longjmp:
	move	r0, r1
	add	r1, 8

	st32	r3, r1
	add	r1, 4
	st32	r4, r1
	add	r1, 4
	st32	r5, r1
	add	r1, 4
	st32	r6, r1
	add	r1, 4
	st32	r7, r1
	add	r1, 4
	st32	r8, r1
	add	r1, 4
	st32	r9, r1
	add	r1, 4
	st32	r10, r1
	add	r1, 4
	st32	r11, r1
	add	r1, 4
	st32	r12, r1
	add	r1, 4
	st32	r13, r1
	add	r1, 4
	st32	r14, r1
	add	r1, 4
	st32	r15, r1
	add	r1, 4
	st32	r16, r1
	add	r1, 4
	st32	r17, r1
	add	r1, 4
	st32	r18, r1
	add	r1, 4
	st32	r19, r1
	add	r1, 4
	st32	r20, r1
	add	r1, 4
	st32	r21, r1
	add	r1, 4
	st32	r22, r1
	add	r1, 4
	st32	r23, r1
	add	r1, 4
	st32	r24, r1
	add	r1, 4
	st32	r25, r1
	add	r1, 4
	st32	r26, r1
	add	r1, 4
	st32	r27, r1
	add	r1, 4
	st32	r28, r1
	add	r1, 4
	st32	r29, r1
	add	r1, 4
	st32	r30, r1
	add	r1, 4
	st32	r31, r1
	add	r1, 4
	st32	r1, r1
	srspw	r1

	ld32	r1, r0
	add	r0, 4
	ld32	r0, r0		; r2, but sotred arg[1] val yet

	cmp	r2, 0
	br	1f, #ne

	move	r2, r0		; if val == 0
	lil	r0, 1
	b	rret, #al
	
1:
	push	r0		; if val != 0
	move	r0, r2
	pop	r0
	b	rret, #al
