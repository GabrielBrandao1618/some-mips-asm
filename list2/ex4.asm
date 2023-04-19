.data
  msgRequestPayment: .asciiz"\nInsira o salario: "
  msgResult: .asciiz"\nNovo salario: "
.text
main:
  li $v0, 4
  la $a0, msgRequestPayment
  syscall

  li $v0, 5
  syscall
  add $t0, $v0, 0

  div $t1, $t0, 4
  add $t0, $t0, $t1

  li $v0, 4
  la $a0, msgResult
  syscall

  li $v0, 1
  add $a0, $t0, 0
  syscall
