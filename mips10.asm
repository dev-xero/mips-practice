.text
main:
	# =====================================
	# ====== Not matching structure, but
	# ====== function
	# =====================================
	# if (a > 0) {
	#    b = 100
	# } else {
	#    b -= 50
	# }
	# ------ Instead can be written as -----
	# b -= 50
	# if (a > 0) {
	#     b = 100
	# }
	# ------- Which is much more efficient ----
	addi $t1, $t1, -50        # b -= 50
	ble $t0, $zero, less_eq   # if (a <= 0) goto less_eq
	li $t1, 100               # b = 100
	
	less_eq:
		li $v0, 10
		syscall