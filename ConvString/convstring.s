		.text
		.global convstring
		.type convstring, %function

convstring:	push {lr}
			mov r1, r0			@r1 contiene la base di x
			mov r2, #0			@r2 contiene i
			mov r3, #0			@r3 contiene il ris parziale			
			ldrb r0, [r1, r2]	@r0 contiene il primo carattere

loop:		cmp r0, #0
			beq fine
			bl convdigit
			lsl r3, r3, #4
			add r3, r3, r0
			add r2, r2, #1
			ldrb r0, [r1, r2]
			b loop

fine:		mov r0, r3
			pop {pc}


convdigit:	cmp r0, #0x30
			cmpge r0, #0x39
			ble num
			sub r0, r0, #0x61
			add r0, r0, #10
			b fine_dig

num:		sub r0, r0, #0x30

fine_dig:	mov pc, lr
