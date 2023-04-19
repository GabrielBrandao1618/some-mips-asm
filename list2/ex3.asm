.data
  msgRequestBirthMonth: .asciiz"\nInsisra mes de nascimento: "
  msgRequestBirthYear: .asciiz"\nInsisra ano de nascimento: "
  msgRequestCurrentMonth: .asciiz"\nInsisra mes atual: "
  msgRequestCurrentYear: .asciiz"\nInsisra ano atual: "
  msgResult: .asciiz"\nIdade em meses: "
.text
main:
  li $v0, 4
  la $a0, msgRequestBirthMonth
  syscall
  # t0 = mês de nascimento, t1 = ano de nascimento
  # t2 = mês atual, t3 = ano atual
  li $v0, 5
  syscall
  add $t0, $v0, 0

  li $v0, 4
  la $a0, msgRequestBirthYear
  syscall

  li $v0, 5
  syscall
  add $t1, $v0, 0

  li $v0, 4
  la $a0, msgRequestCurrentMonth
  syscall

  li $v0, 5
  syscall
  add $t2, $v0, 0

  li $v0, 4
  la $a0, msgRequestCurrentYear
  syscall

  li $v0, 5
  syscall
  add $t3, $v0, 0

  # t4 = idade em anos (Ano atual - ano de nascimento)
  sub $t4, $t3, $t1
  #t5 = idade em meses
  sub $t5, $t2, $t0

  mul $t6, $t4, 12
  add $t5, $t5, $t6

  j showResult

showResult:
  li $v0, 4
  la $a0, msgResult
  syscall

  li $v0, 1
  add $a0, $t5, 0
  syscall
  j end
end:
