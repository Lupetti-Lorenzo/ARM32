      .text
      .global main @ questo file va compilato con -march=armv7ve

main: mov r1, #5
      mov r2, #2
      mov r3, #7
      mla r0, r1, r2, r3 @ calcola 5*2 lo somma a 7 e lo scrive in r0 (=17)
      udiv r3, r0, r2 @ calcola la divisione intera (unsigned) tra 17 e 2 (=8)
      mov r0, #0
      mov pc, lr
