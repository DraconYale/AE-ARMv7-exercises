	.text
	.global main
main:	push {r4,lr} 
		mov r0, #16 	@ 16 valori nella lista
		mov r1, #8 		@ fra 0 e 8
		bl l_alloca 	@ restituisce in r0 la lista
		mov r4, r0 		@ ci salviamo lindirizzo della lista
		bl l_stampa_a 	@ stampa la lista iniziale
		mov r0, r4 		@ puntatore alla lista
		bl subst 		@ r0 vero/falso
		mov r0,r4		 @ puntatore alla lista
		bl l_stampa_a 	@ stampa la lista finale
		pop {r4,pc}		 @ e restituisce il controllo al chiamante
