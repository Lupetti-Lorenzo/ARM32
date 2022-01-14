      .data
   x: .word 7, 12, 8, 2, 3, 5
   n: .word 6
mess: .string "Trovato alla posizione -> %d \n"
fail: .string "Errore malloc\n"
      .text
      .global main

main: push {r4-r7, lr}
      ldr r4, =x @ base vettore x
      ldr r5, =n @ carichiamo indirizzo dove trovare la dimensione del vettore
      ldr r5, [r5]  @ dimensione vettore
      mov r6, #0 @ r6 contiene NULL (zero)

loop: cmp r5, #0
      beq cont
      mov r0, #8 @ alloca nuovo elemento lista
      bl malloc
      cmp r0, #0 @ controllo il risultato della malloc
      beq error
      ldr r7, [r4], #4 @ carico x[i] in r7
      str r7, [r0]  @ metti x[i] nel campo "value" del record attuale
      str r6, [r0, #4]  @ metti valore r6 nel campo "next" del record attuale
      mov r6, r0 @ r6 contiene il puntatore al record attuale
      sub r5, r5, #1 @ decremento contatore
      b loop

cont: mov r1, r6 @ r1 contiene adesso il puntatore al primo record della lista
      mov r0, #5 @ cerco il valore 5
      bl cerca  @ chiama ricerca
      mov r1, r0 @ metto il risultato "pos" in r1
      ldr r0, =mess @ stringa di messaggio
      bl printf @ stampa
      pop {r4-r7, lr} @ ripristina i registri
      mov pc, lr

 err: ldr r0, =fail
      bl printf
      mov r0, #1
      pop {lr}
      mov pc, lr
