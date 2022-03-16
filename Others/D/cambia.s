		.text
		.global cambia
		.type cambia, %function

cambia:	push {lr}
		push {r4, r5, r6, r7, r8}
		push {r0, r1, r2, r3}
		bl strlen
		mov r4, r0					@ls = strlen(s)
		pop {r0, r1, r2, r3}
		mov r5, #0					@i = 0
		mov r6, #0					@sum = 0

loop_c:	cmp r5, r4
		bge fine
		ldrb r8, [r0, r5]
		push {r0}
		mov r0, r8
		bl cambiaV
		mov r7, r0					@cc = cambiaV()
		pop {r0}
		cmp r7, r8
		strneb r7, [r0, r5]
		addne r6, r6, #1
		add r5, r5, #1
		b loop_c

cambiaV: push {lr}
		 sub r0, r0, #0x30			@r9 = v
		 cmp r0, #0
		 cmpge r0, #9
		 bgt fine_cv
		 add r0, r0, #5
		 cmp r0, #9
		 blgt div
fine_cv: add r0, r0, #0x30
		 pop {pc}

div:	push {lr}
		mov r1, #0
loop_div:	cmp r0,#2
		blt end
		sub r0, r0, #2 	@ togli una volta
		add r1, r1, #1 	@ incrementa risultato
		b loop_div
end:	mov r0, r1
		pop {pc}

fine:	mov r0, r6
		pop {r4, r5, r6, r7, r8}
		pop {pc}
