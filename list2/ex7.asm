.data
  msgErrorPurchaseRange: .asciiz"\nERRO: valor da compra deve ser entre 1000 e 9999"
  msgErrorInstallmentRange: .asciiz"\nERRO: valor da parcela deve ser entre 100 e 500"
  msgInstallments: .asciiz"\nQuantidade de parcelas: "
  msgRequestPurchaseValue: .asciiz"\nInsira o valor da compra: "
  msgRequestInstallmentValue: .asciiz"\nInsira o valor da parcela: "
.text
main:
  li $v0, 4
  la $a0, msgRequestPurchaseValue
  syscall
  # t0 = valor da compra, t1 = valor da parcela
  li $v0, 5
  syscall
  add $t0, $v0, 0

  bgt $t0, 9999, errorPurchaseRange
  blt $t0, 1000, errorPurchaseRange

  li $v0, 4
  la $a0, msgRequestInstallmentValue
  syscall

  li $v0, 5
  syscall
  add $t1, $v0, 0

  bgt $t1, 500, errorInstallmentRange
  blt $t1, 100, errorInstallmentRange

  # t2 = quantidade de parcelas a serem pagas
  li $t2, 0
  j payInstallment

payInstallment:
  sub $t0, $t0, $t1
  add $t2, $t2, 1
  bgt $t0, 0, payInstallment

  j showResult

errorPurchaseRange:
  li $v0, 4
  la $a0, msgErrorPurchaseRange
  syscall

  j end
errorInstallmentRange:
  li $v0, 4
  la $a0, msgErrorInstallmentRange
  syscall

  j end
  
showResult:
  li $v0, 4
  la $a0, msgInstallments
  syscall

  li $v0, 1
  add $a0, $t2, 0
  syscall

  j end
end:
