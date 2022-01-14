      .data
   x: .word 1,2,3,4,5,6,7,8 @ primo vettore di 8 elementi
   y: .word 8,7,6,5,4,3,2,1 @ secondo vettore di 8 elementi
   n: .word 8 @ lunghezza dei due vettori
mess: .string "Il risultato e' %d\n"
      .text
      .global main
      .code 32 @ specifica che è codice ARMv7

main: push {lr}
      ldr r0, =n  @ carico in r0 l'indirizzo di n
      ldr r0, [r0] @ carico in r0 il valore n
      ldr r1, =x @ r1 contiene indirizzo base di x
      ldr r2, =y @ r1 contiene indirizzo base di y
      ldr r3, =ipf @ r3 contiene indirizzo della funzione Thumb
      blx r3 @ salto alla procedura ipf e switch ARMv7 -> Thumb
      mov r1, r0 @ metto risultato in r1
      ldr r0, =mess @ carico indirizzo iniziale stringa mess
      bl printf
      pop {lr}
      mov r0, #0
      mov pc, lr
