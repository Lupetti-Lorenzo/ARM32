       .data
  buf: .fill 8192
 blen: .word 8192
  err: .string "Errore syscall\n"
 mess: .string "Letto:\n%s\n"
       .text
       .global main

 main: push {r7, lr}
       ldr r0, [r1, #4] @ r0 indirizzo iniziale nomefile
       mov r1, #0 @ O_RDONLY
       mov r2, #0x0 @ diritti
       mov r7, #5 @ syscall open
       svc 0 @ open!
       cmp r0, #-1 @ controllo errori
       beq error
       push {r0} @ salvo il filedescr sullo stack
       ldr r1, =buf @ r0 = indirizzo buf
       ldr r2, =blen @ carico in r2 indirizzo di blen
       ldr r2, [r2] @ carico in r2 valore di blen
       mov r7, #3 @ syscall read
       svc 0 @ read!
       cmp r0, #-1 @ controllo errori
       beq error
       pop {r0} @ riprendo il filedescr
       mov r7, #6 @ syscall close
       svc 0 @ close!
       cmp r0, #-1 @ controllo error
       beq error
       ldr r0, =mess @ carico in r0 indirizzo stringa messaggio
       bl printf
       pop {r7, lr}
       mov pc, lr

error: ldr r0, =err
       bl printf
       pop {r7, lr}
       mov pc, lr
