.data
    container: .space 44
    newLine: .asciiz " \n"
    prompt: .asciiz "Give a number"
    num: .word 15454

.text 
    _main:

        lw      $s0, num

        li      $t0, 0
        li      $t1, 11 # 11 iretations for 32/3 
        li      $t2, 0 # byte to write to
        _loop1:
            beq     $t0, $t1, _loop1_end

            andi    $s1, $s0, 7 # s1 is current 3bit
            sb      $s1, container($t2)
            
            srl     $s0, $s0, 3
            addi    $t0, $t0, 1
            addi    $t2, $t2, 4
            j _loop1
        _loop1_end:


        # print in reverse order
        li      $t0, 0
        li      $t1, 11 # 11 iretations for 32/3 
        li      $t2, 40 # byte to read from
        _loop2:
            beq     $t0, $t1, _loop2_end

            lb      $a1, container($t2)
            jal     printNumber
            
            addi    $t0, $t0, 1
            addi    $t2, $t2, -4
            j _loop2
        _loop2_end:


    jal     exit;



# pass char into a1 register
printChar:
    li      $v0, 11
    move    $a0, $a1
    syscall
    jr      $ra

# pass number into a1 register
printNumber:
    li		$v0, 1
    move 	$a0, $a1
    syscall
    jr		$ra	
    
# pass string into a1 register
printString:
    li		$v0, 4
    la		$a0, newLine
    syscall
    la		$a0, ($a1) 
    syscall
    jr		$ra	

printNewLine:
    li      $v0, 4
    la      $a0, newLine
    syscall
    jr      $ra

exit:
    li		$v0, 10	
    syscall
