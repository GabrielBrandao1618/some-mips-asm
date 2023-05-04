.data
  msgRequestNumber: .asciiz"\nInsira um numero entre 2 e 50000: "
  msgResponseNumber: .asciiz"\nO primeiro numero primo anterior: "
  msgErrorRange: .asciiz"\nERRO: numero deve ser entre 2 e 50000"
  msgErrorNotFound: .asciiz"\nERRO: numero primo nao encontrado"
.text
main:
  li $v0, 4
  la $a0, msgRequestNumber
  syscall

  li $v0, 5
  syscall
  move $t0, $v0

  bgt $t0, 50000, rangeError
  blt $t0, 2, rangeError

  li $t6, 2

  j loopUntilNumber
  
loopUntilNumber:
  move $t1, $t6
  li $t7, 2
  jal isPrime


  beq $t2, 1, foundPrime

  add $t6, $t6, 1

  blt $t6, $t0, loopUntilNumber
  bgt $t5, 0, showPrime
  j notFound

foundPrime:
  move $t5, $t6
  add $t6, $t6, 1
  j loopUntilNumber

showPrime:
  li $v0, 4
  la $a0, msgResponseNumber
  syscall

  move $a0, $t5
  li $v0, 1
  syscall
  j end

notFound:
  la $a0, msgErrorNotFound
  li $v0, 4
  syscall
  j end
  
rangeError:
  li $v0, 4
  la $a0, msgErrorRange
  syscall

  j main

# Recebe um número pelo t1, e seu retorno é pelo t2
isPrime:
  blt $t7, $t1, isPrimeLoop
  # Se após o loop, nenhum divisor foi encontrado, então o número é primo
  li $t2, 1
  jr $ra

isPrimeLoop:
  rem $t3, $t1, $t7
  beq $t3, 0, isMultiple
  add $t7, $t7, 1
  blt $t7, $t1, isPrimeLoop
  j isPrime

isMultiple:
  li $t2, 0
  jr $ra

end:
