      .data
mess: .string "Fibo(%d) = %d\n"
      .text
      .global main

main: push {lr}
      ldr r0, [r1, #4] @ carico argv[1]
      bl atoi @ lo converto in un intero, risultato in r0
      push {r0} @ salvo n
      bl fibo @ dopo questa in r0 ho Fib(n)
      mov r2, r0 @ salvo Fib(n) in r2
      pop {r1} @ scrivo in r1 il valore n salvato prima
      ldr r0, =mess
      bl printf
      pop {lr}
      mov pc, lr
