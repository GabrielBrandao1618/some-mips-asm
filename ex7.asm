.data
  msgRequest: .asciiz"\nInsira um numero: "
  msgResponse: .asciiz"\nResultado: "
.text
main:
  li $v0, 4
  la $a0, msgRequest
  syscall

  li $v0, 5
  syscall

  add $t0, $v0, 0

  rem $t1, $t0, 2
  beq $t1, 1, isOdd
  beq $t1, 0, isEven

isEven:
  add $t0, $t0, 5
  j end
isOdd:
  add $t0, $t0, 8
  j end
end:
  li $v0, 4
  la $a0, msgResponse
  syscall

  li $v0, 1
  add $a0, $t0, 0
  syscall
