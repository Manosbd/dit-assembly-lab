# ----------------------------------------------------		
#                 	Variables
# ----------------------------------------------------
	.data	         
str1:.asciiz		"Result is "
x:	.word 0x89ABCDEF		
y:	.word 0xFF0000FF

# ----------------------------------------------------		
#                 	main
# ----------------------------------------------------
	.text
	.globl main

main:   
	# --------------   dedomena -------------------
	lw $s1, x				# x
	lw $t1, y				# y
			
	# -------------- algorithmos -------------------
	and $s1, $s1, $t1
	
	sw $s1, x
		
	# ---------- ektiposi apotelesmaton -------------
	la $a0, str1
	jal printstring 
	
	move $a0, $s1
	jal printnumber 
			
	# ----------------    exodos    -----------------
exit:  	
	li $v0, 10			
	syscall

# ----------------------------------------------------		
#                 My functions		
# ----------------------------------------------------
askuser:
	li $v0, 4			# print a0 	
	syscall
	li $v0, 5			# read int
	syscall
	jr $ra
	
printstring:
	li $v0, 4			# print a0
	syscall
	jr $ra
		
printnumber:
	li $v0, 1
	syscall			
	jr $ra
		
printnewln:
	la $a0, snewln
	li $v0, 4
	syscall
	jr $ra	