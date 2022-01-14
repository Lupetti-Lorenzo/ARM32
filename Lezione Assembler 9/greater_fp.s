            .text
            .global greater_fp
            .type greater_fp, %function
            @ r0 contiene indirizzo array, r1 contiene la lunghezza len
            @ s0 contiene il valore val, r0 conterrà il risultato

greater_fp: push {r4, r5}
            mov r3, #0 @ r3 contiene contatore con il risultato
            mov r4, #0 @ r4 indice i del for loop
       for: cmp r4, r1 @ confronto i con len
            beq fine
            ldr r5, [r0], #4 @ carico in r5 array[i]
            vmov s1, r5 @ muovo array[i] in s1
            vcmp.f32 s1, s0 @ confronto array[i] con val
            vmrs apsr_nzcv, fpscr @ istruzione per copiare i flags da fpscr a cpsr
            ble lower
            add r3, r3, #1 @ incremento contatore risultato
     lower: add r4, r4, #1 @ incremento indice i for loop
            b for
      fine: mov r0, r3 @ copio contatore risultato in r0
            pop {r4, r5}
            mov pc, lr @ return
