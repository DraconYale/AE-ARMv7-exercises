		.text
		.global cambia
		.type cambia, %function

cambia:		push {lr}
			push {r4, r5, r6, r7}
			push {r0, r1, r2, r3}
			bl strlen
			mov r4, r0				@ls = strlen(s)
			pop {r0, r1, r2, r3}
			mov r3, #0				@sum = 0
			mov r5, #0				@i = 0
			mov r6, #0				@j = 0
			sub r7, r4, #1

loop_ci:	cmp r5, r7
			bge fine
			add r6, r5, #1
loop_cj:	cmp r6, r4
			bge fine_loop_cj
			mov r1, r5
			mov r2, r6
			push {r0}
			bl cambiaV
			add r3, r3, r0
			pop {r0}
			add r6, r6, #1
			b loop_cj	

fine_loop_cj:	add r5, r5, #1
				b loop_ci

cambiaV:	push {lr}
			push {r8,r9,r10,r11,r12}
			mov r8, #0				@cambio = 0
			mov r9, r0
			ldrb r10, [r0, r1]
			ldrb r11, [r9, r2]
			cmp r10, r11
			ble f_cambiaV
			strb r11, [r0, r1]
			strb r10, [r9, r2]
			mov r8, #1
f_cambiaV:	mov r0, r8
			pop {r8,r9,r10,r11,r12}
			pop {pc}

fine:		mov r0, r3
			pop {r4, r5, r6, r7}
			pop {pc}
