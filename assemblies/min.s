.text
.globl _start

_start:
	la $t0, array
	lw $t1, count
	lw $t2, ($t0)	# holds min
	add $t0, $t0, 4
	add $t1, $t1, -1

loop:
	beqz $t1, exit
	lw $t4, ($t0)	# load next word from array 
	bge $t4, $t2, notmin
	add $t0, $t0, 4
	add $t1, $t1, -1
	j loop

notmin:
	add $t0, $t0, 4
	add $t1, $t1, -1
	j loop
	
exit:
	move $a0, $t2

	li $v0, 1
	syscall

	li $v0, 10
	syscall



.data

array:	.word 6,8,50,17,23,14,2,9,10,60
count:	.word 10