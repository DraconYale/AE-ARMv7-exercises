		.text
		.global push
		.type push, %function

push:	push {lr}
		push {r4, r5, r6}
		mov r4, r0				@r4 contiene x
		mov r5, r1				@r5 contiene puntatore alla testa della coda
		ldr r2, [r1]
		cmp r2, #0				@se la coda è vuota
		beq null
		mov r6, r2
		mov r0, #8
		bl malloc
		cmp r0, #0
		beq error
		str r0, [r5]
		str r4, [r0]
		str r6, [r0, #4]
		pop {r4, r5, r6}
		pop {pc}
		

null:	mov r0, #8
		bl malloc
		cmp r0, #0
		beq error
		str r0, [r5]
		str r4, [r0]
		mov r1, #0
		str r1, [r0, #4]
		pop {r4, r5, r6}
		pop {pc}	
		
error:	mov r7, #1
		pop {r4, r5, r6}
		svc 0
