.data
	msgResult1:.asciiz"\nSalario bruto: "
	msgResult2: .asciiz"\nSalario liquido: "
	msgRequestWorkHours: .asciiz"\nInsira horas normais trabalhadas: "
	msgRequestExtraHours: .asciiz"\nInsira horas extras trabalhadas: "
	msgRequestDiscount: .asciiz"\nInsira o valor de desconto do salario: "
.text
main:
	# t3 = salario bruto, t4 = salario liquido
	# Ler horas trabalhadas e salva em t0
	la $a0, msgRequestWorkHours
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	add $t0, $v0, 0

	# Calcula o valor das horas trabalhadas e soma ao valor total
	mul $t0, $t0, 10
	add $t3, $t3, $t0

	# Ler horas extras e salva em t1
	la $a0, msgRequestExtraHours
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	add $t1, $v0, 0
	# Calcula o valor das horas extras e soma ao valor total
	mul $t1, $t1, 15
	add $t3, $t3, $t1

	# Lê desconto do salário e salva em t2
	li $v0, 4
	la $a0, msgRequestDiscount
	syscall
	
	li $v0, 5
	syscall
	
	add $t2, $v0, 0

	
	# Calcula salário líquido
	li $t7, 100
	sub $t2, $t7, $t2
	div $t4, $t3, 100
	mul $t4, $t4, $t2

	j writeResult

writeResult:
	# Exibe salário bruto

	la $a0, msgResult1
	li $v0, 4
	syscall
	li $v0, 1
	add $a0, $t3, 0
	syscall

	# Exibe salário líquido
	la $a0, msgResult2
	li $v0, 4
	syscall
	add $a0, $t4, 0
	li $v0, 1
	syscall

	j end
	
end:
