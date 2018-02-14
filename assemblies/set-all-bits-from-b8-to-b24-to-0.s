# -----------------------------------------------------------
#			Summary:  Swap 16 middle bits to 0
# -----------------------------------------------------------
#	Input: 	- 1 int number
#	Output: - set bits from 8 to 16, to 0
# -----------------------------------------------------------
#na valw 16 midenika stin mesi

# ----------------------------------------------------		
#                 	Variables
# ----------------------------------------------------
.data
snewln:	.asciiz "\n"	
x:		.word 		0xFFFFFFFF				# 111111111111111111111111111111111
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
	#lw $s0, size					# s0 = number of bits for x
	lw $t0, size					# t0 = i = 32 = number of iterations (loops)
	li $t3,1						# t3 = 1
	li $t4,24
	li $t5,8
	# -------------- algorithmos -------------------			
	 		
ForA:	
	beq $t0,$t4,EndofForA			#	
	add $t0, $t0, -1				# t0--	
	sll $t3, $t3,1	
	j ForA	
EndofForA:	

ForB:
	beq $t0,$t5,EndForB
	move $t4, $t3
	nor $t4,$t4,$t4
	and $s1,$s1,$t4
	add $t0, $t0, -1				# t0--	
	sll $t3, $t3,1	
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


 