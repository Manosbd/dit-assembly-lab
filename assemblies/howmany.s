.text
.globl __start

_start:
	la $a0,read_message
	li $v0,4
	syscall
	
	la $a0,newline
	li $v0,4
	syscall
	
	li $t0, 44	# holds terminate number
	li $t2, 0	# counts zeros
	li $t3, 0	# counts >0
	li $t4, 0	

read:
	li $v0,5
	syscall

	move $t1, $v0
	beq $t1, $t0, exit
	
	bgt $t1, $zero, positive
	beqz $t1, zeros
	blt $t1, $zero, negative

zeros:
	add $t2, $t2, 1
	j read

positive:
	add $t3, $t3, 1
	j read

negative:
	add $t4, $t4, 1
	j read

exit:
	la $a0,positive_message
	li $v0,4
	syscall
	
	move $a0, $t3
	li $v0,1
	syscall

	la $a0,newline
	li $v0,4
	syscall

	la $a0,zeros_message
	li $v0,4
	syscall
	
	move $a0, $t2
	li $v0,1
	syscall
	
	la $a0,newline
	li $v0,4
	syscall

	la $a0,negative_message
	li $v0,4
	syscall
	
	move $a0, $t4
	li $v0,1
	syscall

	la $a0,newline
	li $v0,4
	syscall
	
	j end
end:
	la $a0,end_message
	li $v0,4
	syscall

	la $a0,newline
	li $v0,4
	syscall

	la $a0,exit_message
	li $v0,4
	syscall

	li $v0,10
	syscall


.data

end_message: .asciiz "\nProgram will terminate "
read_message: .asciiz "Give numbers: "
positive_message: .asciiz "Positive: "
negative_message: .asciiz "Negative: "
zeros_message: .asciiz "Zeros: "
exit_message: .asciiz "Au revoir...\n"
newline: .asciiz "\n"