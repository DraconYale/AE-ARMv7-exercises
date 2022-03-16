		.text
		.global mystrstr
		.type mystrstr, %function

mystrstr:	push {lr}
			push {r4, r5, r6, r7, r8, r9, r10}
			push {r0, r1, r2, r3}
			bl strlen
			mov r4, r0			@r4 contiene strlen(stringa)
			pop {r0, r1, r2, r3}
			push {r0, r1, r2, r3}
			mov r0, r1			@passo il secondo argomento a strlen()
			bl strlen
			mov r5, r0			@r5 contiene strlen(parola)
			pop {r0, r1, r2, r3}
			mov r6, #-1			@inizializzo trovata
			mov r7, #0			@inizializzo i
			mov r9, r0			@tengo da parte la base di stringa
			
			sub r8, r4, r5
			add r8, r8, #1		@r8 contiene (ls-lp+1)
loop_mystr:	cmp r7, r8
			bge fine
			add r3, r9, r7 
			mov r0, r3		 	@primo argomento &stringa[i]
			mov r2, r5			@terzo argomento lp
			bl match			@parola è già in r1
			cmp r0, #1
			moveq r6, r7
			beq fine
			add r7, r7, #1
			b loop_mystr

match:		push {lr}
			push {r10,r11,r12}
			mov r11, #1			@res = 1
			mov r12, #0			@i = 0
loop_match:	cmp r12, r2
			bge fine_match
			ldrb r3, [r0, r12]
			ldrb r10, [r1, r12]
			cmp r3, r10
			movne r11, #0
			bne fine_match
			add r12, r12, #1
			b loop_match
			
fine_match:	mov r0, r11		@return(res)
			pop {r10,r11,r12}
			pop {pc}

fine:		mov r0, r6
			pop {r4, r5, r6, r7, r8, r9, r10}
			pop {pc}
