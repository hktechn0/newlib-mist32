# longjmp for mist32
	
	.global	longjmp
	.type	longjmp,@function
longjmp:
	move	r0, r1
	add	r1, 8

	ld32	r3, r1
	add	r1, 4
	ld32	r4, r1
	add	r1, 4
	ld32	r5, r1
	add	r1, 4
	ld32	r6, r1
	add	r1, 4
	ld32	r7, r1
	add	r1, 4
	ld32	r8, r1
	add	r1, 4
	ld32	r9, r1
	add	r1, 4
	ld32	r10, r1
	add	r1, 4
	ld32	r11, r1
	add	r1, 4
	ld32	r12, r1
	add	r1, 4
	ld32	r13, r1
	add	r1, 4
	ld32	r14, r1
	add	r1, 4
	ld32	r15, r1
	add	r1, 4
	ld32	r16, r1
	add	r1, 4
	ld32	r17, r1
	add	r1, 4
	ld32	r18, r1
	add	r1, 4
	ld32	r19, r1
	add	r1, 4
	ld32	r20, r1
	add	r1, 4
	ld32	r21, r1
	add	r1, 4
	ld32	r22, r1
	add	r1, 4
	ld32	r23, r1
	add	r1, 4
	ld32	r24, r1
	add	r1, 4
	ld32	r25, r1
	add	r1, 4
	ld32	r26, r1
	add	r1, 4
	ld32	r27, r1
	add	r1, 4
	ld32	r28, r1
	add	r1, 4
	ld32	r29, r1
	add	r1, 4
	ld32	r30, r1
	add	r1, 4
	ld32	r31, r1
	add	r1, 4
	ld32	r1, r1
	srspw	r1

	ld32	r1, r0
	add	r0, 4

	cmp	r2, 0
	br	1f, #ne

	ld32	r2, r0		; if val == 0
	lil	r0, 1		; return 1
	b	rret, #al

1:
	push	r2		; if val != 0
	ld32	r2, r0
	pop	r0		; return val
	b	rret, #al

.Lend1:
	.size	longjmp,.Lend1-longjmp
