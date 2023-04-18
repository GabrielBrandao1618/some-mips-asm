.data
	msgInsertNum: .asciiz"\nInsert number: "
	msgResult: .asciiz"\nResult: "
.text
main:
	la $a0, msgInsertNum
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	add $t0, $v0, 0

	la $a0, msgInsertNum
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0

	beq $t0, $t1, ifEqual
	j else
ifEqual:
	add $t2, $t0, $t1
	j end
else:
	mul $t2, $t0, $t1
	j end
end:
	la $a0, msgResult
	li $v0, 4
	syscall

	li $v0, 1
	add $a0, $t2, 0
	syscall

