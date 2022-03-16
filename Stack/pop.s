		.text
		.global pop
		.type pop, %function

pop:	push {lr}
		push {r4, r5, r6}
		mov r4, r0			@salvo puntatore di puntatore
		ldr r1, [r0]
		cmp r1, #0			@punta a NULL
		popeq {pc}
		ldr r2, [r1, #4]	@r2 contiene next della testa
		cmp r2, #0
		beq next_null
		mov r5, r2			@salvo next
		ldr r6, [r1]		@salvo valore
		mov r0, r1
		bl free
		str r5, [r4]
		mov r0, r6
		pop {r4, r5, r6}
		pop {pc}

next_null:	ldr r5, [r1]
			mov r0, r1
			bl free
			mov r0, #0
			str r0, [r4]
			mov r0, r5
			pop {r4, r5, r6}
			pop {pc}
