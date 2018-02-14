.text
.globl __start

_start:
	li $s0,0
	l.s $f1,zero

read: 
	li $v0,6
	syscall
	c.eq.s $f0,$f1
	bc1t Exit
	c.lt.s $f0,$f1
	bc1t read
	addi $s0,$s0,1
	j read

Exit: 
	li $v0,10
	syscall



.data
zero: .float 0.0