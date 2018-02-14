.data
    str: .asciiz "abcdefg"
    container: .space 44
    newLine: .asciiz " \n"
    prompt: .asciiz "Give a number"

.text 
    _main:

        li      $v0, 5
        syscall
        move    $s0, $v0
        addi    $s0, -1
        # s0 -> input dec

        la      $s1, str
        lb      $a1, str($s0)
        jal     printChar;

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
