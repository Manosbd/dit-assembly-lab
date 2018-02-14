.data
    str: .asciiz "123456789"
    answer: .asciiz "The length of the string is: "
    newLine: .asciiz "\n"

.text
    _main: 
        la		$t2, str
        li		$t1, 0		# $t1 = 0 length counter
        _nextChar:
            lb		$t0, 0($t2)		# get one byte from string (address pointing at)
            beqz    $t0, _endOfString # break the loop
            addi    $t1, $t1, 1		# i$t1 = $t1 + 1
            addi	$t2, $t2, 1		# move start of string 1 character right
            j _nextChar             # loop again
        _endOfString:
            li		$v0, 4		# $v0 = 4 print stscall cdoe
            la		$a0, answer		# prepare for print sys call
            syscall
            li		$v0, 1		# $v0 = 4 print stscall cdoe
            la		$a0, ($t1)    # print length variable
            syscall
            li		$v0, 4		# $v0 = 4 print stscall cdoe
            la		$a0, newLine    # print anew line
            syscall
        li		$v0, 10		# exit syscall code
        syscall