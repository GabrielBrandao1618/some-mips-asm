.data
	msgInput1: .asciiz"Digite a largura do terreno: \n"
	msgInput2: .asciiz"Digite a extensao do terreno: \n"
	msgResult: .asciiz"A area do terreno e de "
	msgResult2: .asciiz" metros quadrados\n"
.text
main:
	li $v0, 4
	la $a0, msgInput1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0

	li $v0, 4
	la $a0, msgInput2
	syscall

	li $v0, 5
	syscall
	add $t1, $v0, 0

	mul $t2, $t1, $t0
	
	li $v0, 4
	la $a0 msgResult
	syscall

	li $v0, 1
	add $a0, $t2, 0
	syscall

	li $v0, 4
	la $a0 msgResult2
	syscall
	
