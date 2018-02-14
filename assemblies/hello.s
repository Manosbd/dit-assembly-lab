.text

__start:
    la		$a0, message
    li		$v0, 4		# $v0 = 4
    syscall
    li		$v0, 10		# $v0 = 10
    syscall

.data
    message: .asciiz "hello world"
    
    