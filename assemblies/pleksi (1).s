.text
.globl __start

__start:
	la $s1, str1
	la $s2, str2
	la $a0, str3
	li $t0, 0
	li $t1, 10

loop:   beq $t0,$t1,exit
	
	lb $t3, 0($s1)
	sb $t3, 0($a0)
	addi $s1, $s1,1
	addi $a0, $a0,1
	
	lb $t3, 0($s2)
	sb $t3, 0($a0)
	addi $a0,$a0,1
	addi $s2,$s2,1

	addi $t0,$t0,1
	j loop	
	
exit:
	la $a0, -20($a0)

	li $v0,4
	syscall

	li $v0,10
	syscall	
	
		
.data
str1: .asciiz "0123456789"
str2: .asciiz "abcdefghij"
str3: .space 20