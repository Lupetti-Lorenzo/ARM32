         .data
mess:    .string "String = <%s>\n" @ stringa usata per la printf
stringa: .string "stringa da tradurre in maiuscolo" @ stringa da tradurre in maiuscolo

         .text
         .global main
   main: ldr r0, =mess @ r0 contiene indirizzo iniziale di mess
         ldr r1, =stringa @ r1 contiene indirizzo iniziale di stringa
         bl printf

         ldr r1, =stringa @ va ricaricato perchè la chiamata di funzione non lo conserva
   loop: ldrb r2, [r1] @ carica codice ASCII del carattere i-esimo
         cmp r2, #0 @ null terminated string => se è 0 vuol dire che la stringa è finita
         beq fine
         cmp r2, #0x61 @ se è < 'a' passa al prossimo carattere
         blo next
         cmp r2, #0x7a @ se è > 'z' passa al prossimo carattere
         bhi next
         sub r2, r2, #0x20 @ altrimenti togli 'a'-'A' (le maiuscole hanno codici più bassi)
         strb r2, [r1] @ e rimetti il nuovo codice al suo posto in memoria

   next: add r1, r1, #1 @ per il prossimo carattere l'indirizzo aumenta di 1 (bytes)
         b loop

   fine: ldr r0, =mess  @ se hai finito stampa la (nuova) stringa
         ldr r1, =stringa
         bl printf
         mov r7, #1
         svc 0
