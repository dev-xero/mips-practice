.text
main:
	ble $t0, $zero, less_eq_0
	li $t1, 100
	j greater_0
	
	less_eq_0:
		addi $t1, $t1, -100
	
	greater_0:
		li $v0, 10
		syscall	