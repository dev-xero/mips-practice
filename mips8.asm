.text
main:
	# =====================================
	# ======= LEARNING LOOPS ==============
	# =====================================
	ble $t0, 0, less_than_0
	addi $t0, $t0, 1
	
	less_than_zero:
		sll $t0, $t0, 1 # sll, shift by 2^i
		