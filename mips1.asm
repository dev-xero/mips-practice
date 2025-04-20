.data
my_name: .asciiz "xero"
	
.text
main:
	li $v0, 4 # syscall for printing
	la $a0, my_name # load name into arg reg
	syscall
	
	li $v0, 10 # exit syscall
	syscall
		