       .data
 mess: .string "Il valore del fattoriale e' %d\n"
       .text
       .global main

 main: mov r0, #4 @ fattoriale di 4 = 4 * 3 * 2 * 1 = 24
       push {lr}
       bl fact @ chiamata di funzione
       mov r1, r0 @ sposto il risultato in r1
       ldr r0, =mess @ carico in r0 indirizzo stringa della printf
       bl printf
       pop {lr} @ rispristino indirizzo di ritorno
       mov pc, lr

       @ questo è l'entry point della proc ricorsiva
 fact: cmp r0, #0 @ controlla che non sia il caso base: fact(0) = 1
       bne else
       mov r0, #1
       b endif
 else: push {r0, lr}
       sub r0, r0, #1
       bl fact @ dopo questa, r0 contiene Fact(n-1)
       pop {r1, lr} @ r1 qui contiene n
       mul r0, r0, r1
endif: mov pc, lr
