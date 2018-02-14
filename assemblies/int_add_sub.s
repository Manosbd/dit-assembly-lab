.data
    prompt: .asciiz "Give me 2 integers"
    newLine: .asciiz "\n"

.text  
    _main:
        li		$v0, 4		# $v0 = 4
        la		$a0, prompt		# 
        syscall
        
        # integer 1
        li		$v0, 5		# $v0 = 5
        syscall
        la		$s1, ($v0)		# 
        
        # integer 2
        li		$v0, 5		# $v0 = 5
        syscall
        la		$s2, ($v0)		# 

        add		$t0, $s1, $s2		# $t0 = $s1 + $s2
        sub		$t1, $s1, $s2		# $t0 = $s1 - $s2

        jal		PRINT_NEWLINE				# jump to PRINT_NEWLINE and save position to $ra
        
        # print add
        li		$v0, 1		# $v0 = 1
        la		$a0, ($t0)		# 
        syscall

        jal		PRINT_NEWLINE				# jump to PRINT_NEWLINE and save position to $ra

        li		$v0, 1		# $v0 = 1
        la		$a0, ($t1)		# 
        syscall
        
        # exit
        li      $v0, 10
        syscall

PRINT_NEWLINE:
    li		$v0, 4		# $v0 = 4
    la		$a0, newLine		# 
    syscall
    jr $ra