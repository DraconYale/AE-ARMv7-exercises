		.text
		.global isEmpty
		.type isEmpty, %function

isEmpty:	ldr r1, [r0]
			cmp r1, #0
			moveq r0, #1		
			movne r0, #0		
			mov pc, lr
