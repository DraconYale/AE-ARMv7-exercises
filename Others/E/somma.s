		.text
		.global somma
		.type somma, %function

somma:	push {lr}
		push {r4, r5, r6}
		mov r4, #0				@sum = 0
		mov r5, #0				@i = 0
		push {r0, r1, r2, r3}
		bl strlen
		mov r6, r0				@n = strlen(s)
		pop {r0, r1, r2, r3}
		mov r1, r0				@salvo la base di s

loop_s:	cmp r5, r6
		bge fine
		ldrb r0, [r1, r5]		@carico s[i]
		bl quanto
		add r4, r4, r0
		add r5, r5, #1
		b loop_s

quanto:	push {lr}
		push {r7, r8}
		mov r7, #0				@ret = 0
		sub r8, r0, #0x30		@v = c - '0'
		cmp r8, #0
		cmpge r8, #9
		bgt	fine_q
		mov r7, r8

fine_q:	mov r0, r7
		pop {r7, r8}
		pop {pc}

fine:	mov r0, r4
		pop {r4, r5, r6}
		pop {pc}
