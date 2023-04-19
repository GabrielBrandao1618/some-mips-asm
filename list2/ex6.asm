.data
  msgBigger: .asciiz"\nMaior: "
  msgLower: .asciiz"\nMenor: "
  msgRequestNum: .asciiz"\nInsira um numero: "
  msgEqual: .asciiz"\nNumeros sao iguais."
.text
main:
  li $v0, 4
  la $a0, msgRequestNum
  syscall

  li $v0, 5
  syscall
  add $t0, $v0, 0

  li $v0, 5
  syscall
  add $t1, $v0, 0
  
  beq $t0, $t1, isEqual
  bgt $t0,$t1, firstBigger
  j secondBigger

firstBigger:
  li $v0, 4
  la $a0, msgBigger
  syscall

  li $v0, 1
  add $a0, $t0, 0
  syscall

  li $v0, 4
  la $a0, msgLower
  syscall

  li $v0, 1
  add $a0, $t1, 0
  syscall

  j end

secondBigger:
  li $v0, 4
  la $a0, msgBigger
  syscall

  li $v0, 1
  add $a0, $t1, 0
  syscall

  li $v0, 4
  la $a0, msgLower
  syscall

  li $v0, 1
  add $a0, $t0, 0
  syscall
  j end

isEqual:
  li $v0, 4
  la $a0, msgEqual
  syscall

  j end
end:

