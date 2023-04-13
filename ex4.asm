.data
	msgResult: .asciiz"\nArea do trapezio: "
	msgRequestBase1: .asciiz"\nDigite o tamanho de uma das bases: "
	msgRequestBase2: .asciiz"\nDigite o tamanho da outra base: "
.text
main:
	# print msgRequestBase1
	li $v0, 4
	la $a0, msgRequestBase1
	syscall

	li $v0, 5
	syscall
	# t0 = base1
	add $t0, $v0, 0
	
	# print msgRequestBase2
	li $v0, 4
	la $a0, msgRequestBase2
	syscall

	li $v0, 5
	syscall
	#t1 = base2
	add $t1, $v0, 0
	
	li $v0, 5
	syscall
	# t2 = altura
	add $t2, $v0, 0

	# Guardar a media entre as duas bases em t0
	add $t0, $t0, $t1
	div $t0, $t0, 2
	
	#t3 = area do triangulo
	mul $t3, $t0, $t2

	j writeResult
writeResult:
	la $a0, msgResult
	li $v0, 4
	syscall

	add $a0, $t3, 0
	li $v0, 1
	syscall
	
	j end
	
end:
