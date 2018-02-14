.text
.globl __start

main:
	l.s $f1,zero
read: 
	la $a0,read_message
	li $v0,4
	syscall

	li $v0,6	# read float number
	syscall

	la $a0,newline
	li $v0,4
	syscall

	mov.s $f12,$f0
	li $v0,2	# printf float
	syscall

	cvt.w.s $f12,$f0
	cvt.s.w $f2, $f12
	c.eq.s $f0,$f1
	bc1t Exit
	c.eq.s $f2,$f0
	bc1t an_yes

	la $a0,no
	li $v0,4
	syscall

	j read
an_yes:
	la $a0,yes
	li $v0,4
	syscall
	j read

Exit: 
	la $a0,exit
	li $v0,4
	syscall
	li $v0,10
	syscall


.data

zero: .float 0.0
read_message: .asciiz "Give number: "
exit: .asciiz "Exit!\n"
yes: .asciiz ": yes\n"
no: .asciiz ": no\n"
newline: .asciiz "\n"