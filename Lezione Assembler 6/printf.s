         .data
   mess: .string "Il valore e' %d\n"
         .text
         .global main

   main: mov r2, #123 @ primo valore da stampare
         mov r3, #15  @ secondo valore da stampare
         ldr r0, =mess @ r0 contiene indirizzo iniziale di stringa
         mov r1, r2 @ r1 contiene il primo valore da stampare
         push {r0, r3, lr}
         bl printf
         pop {r0, r1}
         bl printf
         pop {lr}
         mov r0, #0
         mov pc, lr
