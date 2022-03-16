		.text
		.global subst
		.type subst, %function

subst:	cmp r0, #0
		moveq pc, lr
		ldr r1, [r0, #4]
		cmp r1, #0
		moveq pc, lr

		ldr r2, [r0]
		ldr r3, [r1]
		cmp r2, r3
		strge r2, [r1]
		strge r3, [r0]
		mov r0, r1
		b subst	
