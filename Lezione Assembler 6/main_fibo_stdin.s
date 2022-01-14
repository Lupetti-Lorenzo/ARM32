      .data
mess: .string "Fibo(%d) = %d\n"
 err: .string "Errore read\n"
 buf: .fill 128 @ spazio per stringa da 128 caratteri
      .text
      .global main

main: push {lr}
      mov r0, #0 @ r0 contiene l'indice di stdin
      ldr r1, =buf @ r1 contiene indirizzo inziale del buffer
      mov r2, #128 @ r2 contiene dimensione del buffer
      mov r7, #3 @ una read è la syscall no. 3
      svc 0 @ read!
      cmp r0, #-1
      beq bad
      ldr r0, =buf @ ricarico in r0 indirizzo del buffer
      bl atoi @ lo converto in un intero, risultato in r0
      push {r0} @ salvo n
      bl fibo @ dopo questa in r0 ho Fib(n)
      mov r2, r0 @ salvo Fib(n) in r2
      pop {r1} @ scrivo in r1 il valore n
      ldr r0, =mess
      bl printf
      pop {lr}
      mov r0, #0
      mov pc, lr

 bad: ldr r0, =err
      bl printf
      pop {lr}
      mov r0, #1
      mov pc, lr @ return 1
