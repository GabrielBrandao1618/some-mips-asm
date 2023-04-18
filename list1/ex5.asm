.data
	msgCateto1: .asciiz"\nDigite o valor do primeiro cateto: "
	msgCateto2: .asciiz"\nDigite o valor do outro cateto: "
	msgResult: .asciiz"\nA hipotenusa vale: "
	msgError: .asciiz"\nERRO: nao foi possivel calcular a hipotenusa..."
.text
main:
	# Ler cateto 1
	li $v0, 4
	la $a0, msgCateto1
	syscall

	li $v0, 5
	syscall
	add $t0, $v0, 0

	# Ler cateto 2
	li $v0, 4
	la $a0, msgCateto2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0

	# Elevar ambos os catetos ao quadrado
	mul $t0, $t0, $t0
	mul $t1, $t1, $t1

	# Somar os quadrados dos catetos
	add $t2, $t0, $t1
	
	# $t5 = raiz quadrada, inicia como zero e será calculada
	li $t5, 0
	j calcRoot
calcRoot:
	
	mul $t6, $t5, $t5
	beq $t6, $t2, showResult
	bgt $t6, $t2, error
	add $t5, $t5, 1
	j calcRoot
showResult:
	li $v0, 4
	la $a0, msgResult
	syscall

	li $v0, 1
	add $a0, $t5, 0
	syscall

	j end
error:
	li $v0, 4
	la $a0, msgError
	syscall
	j end
end:

