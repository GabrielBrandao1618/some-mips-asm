.data
  msgFirstNum: .asciiz"\nInsira o primeiro valor: "
  msgSecondNum: .asciiz"\nInsira o segundo valor: "
  msgFirst: .asciiz"\nPrimeiro valor: "
  msgSecond: .asciiz"\nSegundo valor: "
.text
main:
  li $v0, 4
  la $a0, msgFirstNum
  syscall

  li $v0, 5
  syscall
  add $t0, $v0, 0

  li $v0, 4
  la $a0, msgSecondNum
  syscall

  li $v0, 5
  syscall
  add $t1, $v0, 0

  add $t2, $t1, 0
  add $t1, $t0, 0
  add $t0, $t2, 0

  li $v0, 4
  la $a0, msgFirst
  syscall

  li $v0, 1
  add $a0, $t0, 0
  syscall

  li $v0, 4
  la $a0, msgSecond
  syscall

  li $v0, 1
  add $a0, $t1, 0
  syscall
