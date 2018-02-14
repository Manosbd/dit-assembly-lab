.text
.globl __start

_start:
	l.s $f1,num
	l.s $f5, zero

read:
	la $a0,read_message
	li $v0,4
	syscall
	
	li $v0,6	# read float number
	syscall
	
	mov.s $f2,$f0
	c.eq.s $f5, $f2
	bc1t exit
	
	c.le.s $f2, $f1
	bc1t small
	
big:
	la $a0,big_message
	li $v0,4
	syscall
	
	mov.s $f12,$f2
	li $v0,2	# printf float
	syscall
	
	la $a0,newline
	li $v0,4
	syscall
	
	j read

small:
	la $a0,small_message
	li $v0,4
	syscall
	
	la $a0,newline
	li $v0,4
	syscall
	
	j read
	

exit:
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

zero: .float 0.0
num: .float 1000.0
read_message: .asciiz "Give number: "
big_message: .asciiz "BIG =  "
small_message: .asciiz "TOO-SMALL "
end_message: .asciiz "\nProgram will terminate "
exit_message: .asciiz "Au revoir...\n"
newline: .asciiz "\n"