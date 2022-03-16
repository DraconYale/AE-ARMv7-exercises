		.data
fmt:	.string "%d -> "
nl:		.string "\n"
		.text
		.global l_stampa_a
		.type l_stampa_a, %function

l_stampa_a:	cmp r0, #0
			moveq pc, lr
			push {r4, lr}
			mov r4, r0
loop:		cmp r4, #0
			beq fine
			ldr r0, =fmt
			ldr r1, [r4]
			bl printf
			ldr r4, [r4, #4]
			b loop
fine:		ldr r0, =nl
			bl printf
			pop {r4, pc}
