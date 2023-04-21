.data
  msgInsertNumberRequest: .asciiz"\nInsira um numero entre 100 e 999: "
  msgError: .asciiz"\nERRO: Numero inserido fora do intervalo de 100 a 999"
  msgHundred: .asciiz"\nCentena = "
  msgTen: .asciiz"\nDezena = "
  msgUnit: .asciiz"\nUnidade = "
.text
main:
  li $v0, 4
  la $a0, msgInsertNumberRequest
  syscall

  li $v0, 5
  syscall

  add $t0, $v0, 0
  bgt $t0, 999, error
  blt $t0, 100, error

  # t1, é centena, t2 dezena e t3 unidade
  li $t1, 0
  li $t2, 0
  li $t3, 0
  j hundred

hundred:
  sub $t0, $t0, 100
  add $t1, $t1, 1

  bge $t0, 100, hundred
  bge $t0, 10, ten
  bge $t0, 1, unit
  j success
ten:
  sub $t0, $t0, 10
  add $t2, $t2, 1

  bge $t0, 10, ten
  bge $t0, 1, unit
  j success

unit:
  sub $t0, $t0, 1
  add $t3, $t3, 1

  bge $t0, 1, unit
  j success


error:
  li $v0, 4
  la $a0, msgError
  syscall
  j end

success:
  li $v0, 4
  la $a0, msgHundred
  syscall

  li $v0, 1
  add $a0, $t1, 0
  syscall

  li $v0, 4
  la $a0, msgTen
  syscall


  li $v0, 1
  add $a0, $t2, 0
  syscall

  li $v0, 4
  la $a0, msgUnit
  syscall

  li $v0, 1
  add $a0, $t3, 0
  syscall

  j end

end:
