.data
  msgRequestNum: .asciiz"\nInsira um numero: "

  msgFirstGroup: .asciiz"\nNumeros entre 0 e 25: "
  msgSecondGroup: .asciiz"\nNumeros entre 26 e 50: "
  msgThirdGroup: .asciiz"\nNumeros entre 51 e 75: "
  msgFourthGroup: .asciiz"\nNumeros entre 76 e 100: "
.text
main:
  li $t3, 0
  li $t4, 0
  li $t5, 0
  li $t6, 0
  # t3, t4, t5 e t6 serão reservados a contar cada um dos intervalos

readNum:
  li $v0, 4
  la $a0, msgRequestNum
  syscall

  li $v0, 5
  syscall

  blt $v0, 0, end
  blt $v0, 26, incrementFirst
  blt $v0, 51, incrementSecond
  blt $v0, 76, incrementThird
  blt $v0, 100, incrementFourth
  j readNum

incrementFirst:
  add $t3, $t3, 1
  j readNum

incrementSecond:
  add $t4, $t4, 1
  j readNum

incrementThird:
  add $t5, $t5, 1
  j readNum

incrementFourth:
  add $t6, $t6, 1
  j readNum

end:
  li $v0, 4
  la $a0, msgFirstGroup
  syscall

  li $v0, 1
  add $a0, $t3, 0
  syscall

  li $v0, 4
  la $a0, msgSecondGroup
  syscall

  li $v0, 1
  add $a0, $t4, 0
  syscall

  li $v0, 4
  la $a0, msgThirdGroup
  syscall

  li $v0, 1
  add $a0, $t5, 0
  syscall

  li $v0, 4
  la $a0, msgFourthGroup
  syscall

  li $v0, 1
  add $a0, $t6, 0
  syscall
