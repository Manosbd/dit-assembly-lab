.data
    newLine: .asciiz " \n"
    prompt: .asciiz "Give an integer"
    success: .asciiz "It is /16\n"

.text
    _main:
        li		$v0, 5
        syscall
        move 	$t0, $v0		# $t0 = $a0
        # 16 = 10000, 15 = 01111, koitao an i maska ARITHMOS & 15 = 0
        and     $t1, $t0, 15
        bne		$zero, $t1, _end	# if $t2 != $t1 then _end
        la		$a1, success		# 
        jal		printString				# jump to printString and save position to $ra
        
        
    _end:
        jal exit
        
        

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