           .text
           .global match
           .global substring
           .type match, %function
           .type substring, %function

           @ r0 contiene uno, r1 contiene due, r2 contiene len,
           @ r0 avrà il valore di ritorno
    match: mov r3, #1 @ r3 sarà res
           push {r4-r6}
           mov r4, #0 @ r4 indice for
     for1: cmp r4, r2
           bhs finefor1
           ldrb r5, [r0, r4] @ r5 contiene uno[i]
           ldrb r6, [r1, r4] @ r6 contiene due[i]
           cmp r5, r6
           beq fineif
           mov r3, #0
           b finefor1
   fineif: add r4, r4, #1
           b for1
 finefor1: pop {r4-r6}
           mov r0, r3 @ ritorno r3 spostandolo in r0
           mov pc, lr

           @ r0 contiene indirizzo stringa, r1 contiene parola,
           @ r0 conterrà valore di ritorno
substring: push {r0, r1, lr}
           bl strlen @ calcolo ls
           mov r2, r0 @ r2 contiene ls
           pop {r0, r1}
           push {r0-r2}
           mov r0, r1 @ r0 contiene indirizzo parola
           bl strlen @ calcolo lp
           mov r3, r0 @ r3 contiene lp
           pop {r0-r2}
           push {r4-r7}
           mov r4, #-1 @ r4 contiene trovata
           sub r5, r2, r3
           add r5, r5, #1 @ r5 contiene (ls - lp + 1)
           mov r6, #0 @ r6 indice del for
     for2: cmp r6, r5
           bhs finefor2
           push {r0-r3}
           add r0, r0, r6 @ r0 contiene l'indirizzo iniziale da considerare per stringa
           mov r2, r3 @ r2 contiene lp
           bl match
           mov r7, r0 @ r7 contiene il valore di ritorno di match
           pop {r0-r3}
           cmp r7, #1
           bne fineif2
           mov r0, r6 @ copio indice loop in r0 (posizione parola)
           b finefor2
  fineif2: add r6, r6, #1 @ incremento indice for
           b for2
 finefor2: pop {r4-r7, lr}
           mov pc, lr
