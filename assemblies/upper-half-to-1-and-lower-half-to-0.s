# -----------------------------------------------------------
#			Summary:  set 16 MSB to 1 and 16 LSB to 0 
# -----------------------------------------------------------
#	Input: 	- 1 int number
#	Output: - set 16 MSB to 1 and 16 LSB to 0
#					eg: 11111111111111110000000000000000
# 							= 0xFFFF0000
# -----------------------------------------------------------

# -----------------------------------------------------------		
#                 	Variables
# -----------------------------------------------------------
.data
snewln:	.asciiz "\n"	
x:		.word 		240		# 00000000000000000000000011110000
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
	lw $t0, size					# t0 = i = 32 = number of iterations (loops)
	li $t3,1						# t3 = 1
	li $t2,16                       # metritis gia na kratisw ta prwta 16 psifia apo to telos
	# -------------- algorithmos -------------------			
	 		
ForA:	
	beq $t0, $t2, EndofForA		# an diesxisa ta 16 psifia pou ta ekana miden paw sto EndofForA
	move $t5, $t3
	nor $t5, $t5, $t5
	and $s1, $s1, $t5				
nextA:			 
	add $t0, $t0, -1			# alliws meiwnw kata ena ton metriti ka i kanw olisthisi kata mia thesi to $t3
	sll $t3, $t3, 1				# t1 << 1
	j ForA
EndofForA:	

ForB:
	beq $t0,$zero,EndofForB		#an $t0=0 simainei diesxisa kai ola ta bit ara exodos 
	or $s1,$s1,$t3				#
	sll $t3, $t3, 1	
nextB:		
	add $t0, $t0, -1			# t0--		
	j ForB	
EndofForB:
	
		
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


