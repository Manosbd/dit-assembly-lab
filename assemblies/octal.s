.text
.globl __start

main:
	li $t0, 0	# holds zero
	li $t1, 8
read: 
	la $a0, read_message
	li $v0, 4
	syscall

	li $v0, 5	
	syscall
	move $t2, $v0
	
	beqz $t2, exit
	blt $t2, $t0, read

octal:
	div $t3, $t3, $t1

	
	la $a0,newline
	li $v0,4
	syscall
 
	la $a0, exit_message
	li $v0, 4
	syscall

	move $a0, 
	li $v0, 1	
	syscall

	j read


exit:
	la $a0,newline
	li $v0,4
	syscall
 
	la $a0, exit_message
	li $v0, 4
	syscall

	li $v0, 10
	syscall


.data

read_message: .asciiz "Give positive number: "
octal_message: .asciiz "Octal = "
wrong_num: .asciiz "Please enter positive number: "
exit_message: .asciiz "Au revoir... "
newline: .asciiz "\n"