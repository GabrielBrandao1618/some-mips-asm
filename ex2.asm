.data
	msgPequena: .asciiz"\nInsira a quantidade de camisetas pequenas: "
	msgMedia: .asciiz"\nInsira a quantidade de camisetas medias: "
	msgGrande: .asciiz"\nInsira a quantidade de camisetas grandes: "
	msgResult: .asciiz"\nValor total: "
.text
main:
	li $v0, 4
	la $a0, msgPequena
	syscall

	# Salva a quantidade inserida em t0 e calcula o total
	li $v0, 5
	syscall

	add $t0, $v0, 0
	mul $t0, $t0, 10
	add $t5, $t5, $t0

	li $v0, 4
	la $a0, msgMedia
	syscall

	li $v0, 5
	syscall
	add $t1, $v0, 0
	mul $t1, $t1, 12
	
	add $t5, $t5, $t1

	li $v0, 4
	la $a0, msgGrande
	syscall

	li $v0, 5
	syscall
	add $t3, $v0, 0
	mul $t3, $t3, 15

	add $t5, $t5, $t3

	j writeResult

writeResult:
	li $v0, 4
	la $a0, msgResult
	syscall

	li $v0, 1
	add $a0, $t5, 0
	syscall
	j end
end:

	