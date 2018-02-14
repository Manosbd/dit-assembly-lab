.text
.globl __start

__start:
	la $t0, zero	# put zero in $f1
	l.s $f1, 0($t0)
	li $s1, 0x7f800000	# mask to find the exponent
loop:
	li $v0, 6	# $f0 = float from console
	syscall

	c.eq.s $f1, $f0	# if $f0 = 0
	bc1t exit	# exit program
	mfc1 $s0, $f0	# move $f0 to $s0
	and $s2, $s1, $s0	# keep only the exponent bits
	srl $s2, $s2, 23	# make the first exponent bit the 				least important bit
	addi $s2, $s2, -127	# no bias
	li $v0, 1	# print exponent
	move $a0, $s2
	syscall

	la $a0, endl	
	li $v0, 4
	syscall
	
	j loop	# continue to read next number
exit:
	li $v0, 10	# au revoir...
	syscall

.data	

zero:	.float 0.0
endl:	.asciiz "\n"