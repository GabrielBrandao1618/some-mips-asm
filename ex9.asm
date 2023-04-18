.data
  msgRequestNumber: .asciiz"\nInsira um numero: "
  msgResponse: .asciiz"\nResultado: "
  msgReadAgain: .asciiz"\nNumero nao pode ser 0. Tente novamente"
.text
main:
  li $v0, 4
  la $a0, msgRequestNumber
  syscall

  li $v0, 5
  syscall
  add $t0, $v0, 0

  li $v0, 4
  la $a0, msgRequestNumber
  syscall

  j readSecond
readSecond:
  li $v0, 5
  syscall
  add $t1, $v0, 0
  beq $t1, 0, readAgain

  div $t2, $t0, $t1

  j end

readAgain:
  li $v0, 4
  la $a0, msgReadAgain
  syscall

  j readSecond

end:
  li $v0, 4
  la $a0, msgResponse
  syscall
  
  li $v0, 1
  add $a0, $t2, 0
  syscall
