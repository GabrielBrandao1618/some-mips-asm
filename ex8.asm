.data
  msgRequest: .asciiz"\nInsira valor inteiro: "
  msgResponse: .asciiz"\nResultado: "
.text
main:
  li $v0, 4
  la $a0, msgRequest
  syscall

  li $v0, 5
  syscall

  add $t0, $v0, 0

  bgt $t0, 0, isPositive
  blt $t0, 0, isNegative
  j end

isPositive:
  mul $t0, $t0, 2
  j end

isNegative:
  mul $t0, $t0, 3
  j end

end:
  li $v0, 4
  la $a0, msgResponse
  syscall

  li $v0, 1
  add $a0, $t0, 0
  syscall
