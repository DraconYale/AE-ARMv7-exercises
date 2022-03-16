		.text
		.global cambia
		.type cambia, %function

cambia:	push {lr}
		push {r4,r5,r6,r8}
		push {r0,r1,r2,r3}	
		bl strlen		@r0 contiene strlen(s)
		mov r4, r0		@sposto strlen(s) in r4
		pop {r0,r1,r2,r3}	@ripristino i registri sporcati
		mov r3, r0		@r3 contiene la base di char* s
		mov r5, #0		@assegno 0 a r5 (int sum = 0)
		mov r6, #0		@inizializzo i=0

loop_c:	cmp r6, r4
		bge fine
		ldrb r0, [r3, r6]	@primo parametro di cifra
		bl cifra
		ldrb r8, [r3, r6]
		cmp r0, r8
		strneb r0, [r3, r6]
		addne r5, r5, #1
		add r6, r6, #1
		b loop_c
		
cifra:	push {r7}
		mov r7, r0
		cmp r0, #0x61
		cmpge r0, #0x7a
		ble fun_c
		pop {r7}
		mov pc,lr
		
fun_c:	add r7, r0, r1
		cmp r7, #0x7a
		subgt	r7, r7, #0x7a
		addgt	r7, r7, #0x61
		subgt	r7, r7, #1
		mov r0, r7
		pop {r7}
		mov pc, lr

fine: 	mov r0, r5
		pop {r4,r5,r6,r8}
		pop {pc}
