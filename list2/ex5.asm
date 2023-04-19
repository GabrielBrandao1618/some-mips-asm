.data
  msgTwoRoot: .asciiz"\nDUAS RAIZES REAIS"
  msgOneRoot: .asciiz"\nUMA RAIZ REAL"
  msgZeroRoot: .asciiz"\nNAO EXISTEM RAIZES REAIS"
.text
main:
  # t0 = A, t1 = B, t2 = C
  li $v0, 5
  syscall
  add $t0, $v0, 0

  li $v0, 5
  syscall
  add $t1, $v0, 0

  li $v0, 5
  syscall
  add $t2, $v0, 0

  # t4 = 4AC
  mul $t4, $t0, $t2
  mul $t4, $t4, 4

  # t5 = b^2
  mul $t5, $t1, $t1

  # t3 = delta
  sub $t3, $t5, $t4

  beq $t3, 0, equalZero
  bgt $t3, 0, positive
  j negative

positive:
  li $v0, 4
  la $a0, msgTwoRoot
  syscall
  j end
negative:
  li $v0, 4
  la $a0, msgZeroRoot
  syscall
  j end
equalZero:
  li $v0, 4
  la $a0, msgOneRoot
  syscall
  j end
end:
  
