.data
  msgInsert: .asciiz"\nInsira a altura em cm: "
  msgMax: .asciiz"\nMenor altura: "
  msgMin: .asciiz"\nMaior altura: "
.text
main:
  li $v0, 4
  la $a0, msgInsert
  syscall

  li $v0, 5
  syscall
  # t0 é a menor altura, e t1, a maior
  add $t0, $v0, 0
  add $t1, $v0, 0

  li $t2, 1
readHeight:
  add $t2, $t2, 1
 
  li $v0, 4
  la $a0, msgInsert
  syscall

  li $v0, 5
  syscall

  add $t3, $v0, 0


  bgt $t3, $t1, newMax
  blt $t3, $t0, newMin

  blt $t2, 15, readHeight
  j end

newMax:
  add $t1, $t3, 0
  blt $t2, 15, readHeight
  j end

newMin:
  add $t0, $t3, 0
  blt $t2, 15, readHeight
  j end

end:
  li $v0, 4
  la $a0, msgMin
  syscall

  li $v0, 1
  add $a0, $t0, 0
  syscall

  li $v0, 4
  la $a0, msgMax
  syscall

  li $v0, 1
  add $a0, $t1, 0
  syscall

