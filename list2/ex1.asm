.data
  msgRequest: .asciiz"\nInsira o valor em dolar: "
  msgResponse: .asciiz"\nValor convertido em real: "
.text
main:
  li $v0, 4
  la $a0, msgRequest
  syscall

  li $v0, 5
  syscall

  mul $t0, $v0, 5

  li $v0, 4
  la $a0, msgResponse
  syscall

  add $a0, $t0, 0
  li $v0, 1
  syscall
