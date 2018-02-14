# -----------------------------------------------------------
#		Summary:  Swap middle 16 bits from anything to 1
# -----------------------------------------------------------
#	Input: 	- 1 int number
#	Output: - swap bits 8 to 24 to 1
# -----------------------------------------------------------

# ----------------------------------------------------		
#                 	Variables 
# ----------------------------------------------------
.data
snewln:	.asciiz "\n"	
x:		.word 		0				# 000000000000000000000000000000000
size:	.word 		32
ans:	.asciiz 	"to apotelesma einai: "

# ----------------------------------------------------		
#                 	main   
# ----------------------------------------------------
.text
.globl main

main:   
	# --------------   dedomena -------------------
	lw $s1, x						# s1 = x
	lw $s0, size					# s0 = number of bits for x
	li $t3, 1						# t3 = 1 = mask
		
	# -------------- algorithmos -------------------			
	
	# calculate initial mask (shift left 8 times)
	li $t0,0
	li $t4,8		
ForA:								# left shift t3 8 times  (t3 = 2^8)
	beq $t0, $t4, EndForA
	sll $t3, $t3, 1		
nextA:	
	add $t0, $t0, 1	
	j ForA
EndForA:
	
	li $t0,0
	li $t4,16
ForB:
	beq $t0,$t4,EndForB
	or $s1,$s1,$t3					# set bit to 1
	sll $t3, $t3, 1
nextB:
	add $t0, $t0, 1	
	j ForB
EndForB:
		
	# ---------- ektiposi apotelesmaton -------------
	la $a0,snewln					# a0 = "\n"
	jal printstring 				# print a0
	
	# print number of zeros
	la $a0, ans						# a0 = "to apotelesma einai: "	
	jal printstring					# print a0
	move $a0,$s1					# a0 = s1 = number of zero
	jal printnumber					# print a0
	
	la $a0, snewln					# a0 = "\n"
	jal printstring					# print a0
		
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


