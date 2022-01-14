       .text
       .global media @ r0 contiene indirizzo vettore valori
                     @ r1 contiene indirizzo double media
       .type media, %function

media: push {r4, lr}
       mov r4, r1 @ r4 contiene indirizzo dove scrivere la media
       mov r1, #0 @ r1 contiene la somma dei valori
       mov r2, #0 @ r2 verrà usato come indice del loop
loop:  ldr r3, [r0], #4 @ r3 contiene valori[i]
       cmp r3, #-1 @ fine voti ?
       beq fine
       add r1, r1, r3 @ sum += v[i]
       add r2, r2, #1 @ incremento indice loop
       b loop
fine:  vmov s0, r1 @ sposto la somma in un registro fp
       vcvt.f32.u32 s0, s0 @ converto la somma in fp32
       vmov s1, r2 @ sposto in s1 il numero di valori
       vcvt.f32.u32 s1, s1 @ converti in singola precisione
       vdiv.f32 s0, s0, s1 @ calcola la media
       vcvt.f64.f32 d7, s0 @ converti in doppia precisione (perché media deve essere un double)
       vstr d7, [r4] @ store del numero in doppia prec
       pop {r4, lr}
       mov pc,lr
