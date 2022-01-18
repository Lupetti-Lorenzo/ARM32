.text
.global vect_scalar @ r0 indirizzo base array
				 @ r1 valore x
				 @ r2 dimensione array
.type vect_scalar, %function
 
vect_scalar:	mov r3, #0 @ indice array (del for) 
loop:			cmp r3, r2
				beq fine
				ldr r12, [r0]
				mul r12, r12, r1
				str r12, [r0], #4
				add r3, r3, #1
				b loop
fine: 			mov pc, lr










