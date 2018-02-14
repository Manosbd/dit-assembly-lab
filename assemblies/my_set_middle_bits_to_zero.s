.data
    newLine: .asciiz " \n"
    prompt: .asciiz "Give a string"
    no: .word 0xFFFF0FFF
    mask: .word 0xFF0000FF

.text
    _main:
        lw		$t1, no		# 
        lw      $t2, mask

        and		$t3, $t1, $t2		# $tt0= $t1 + $t2
        
        


        

        
    _end:
        jal		exit			# jump to exit and save position to $ra
        





exit:
    li		$v0, 10	
    syscall

# pass number into a1 register
printNumber:
    li		$v0, 4
    la		$a0, newLine
    syscall
    li		$v0, 1
    move 	$a0, $a1
    syscall
    jr		$ra	
    
# pass number into a1 register
printString:
    li		$v0, 4
    la		$a0, newLine
    syscall
    la		$a0, ($a1) 
    syscall
    jr		$ra	