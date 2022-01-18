.text 
.global cifra @ r0 char, r1 intero num di posizioni da spostare il carattere
.type cambia, %function

cifra: 
    @ primo if, se è >z || <a vado a fine 
    cmp r0, # 0x7a
    bhi fine
    cmp r0, # 0x61
    blo fine
    mov r2, r0 @ char cc = c
    add r2, r2, r1 @ c = c + n
    cmp r2, #0x7a @ se e compreso tra a e z fine
    bls fine
    @ altrimenti decremento
    sub r2, r2, #0x7a
    add r2, r2, #0x61
    sub r2, r2, #1
fine:
   mov r0, r2
   mov pc, lr


