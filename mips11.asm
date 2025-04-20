.text
main:
	# ==================================================
	# ======== COMPOUND CONDITIONS
	# ==================================================
	# if (a > 10 && a < b) {
	#    c += 20
	# }
	# b &= 0xFF
	# -------------------------------------------------
	# you have to break down the problem to closely
	# remsemble the program logic
	# -------------------------------------------------
	# if (a <= 10 || a >= b) {
	#     goto no_add_20
	# }
	# c += 20
	# no_add_20:
	#     b &= 0xFF
	# ---------------------------------------------------
	# the key idea is to invert the condition, and then
	# optionally use De Morgan's Law for compound
	# expressions
	# ---------------------------------------------------
	li $t9, 10
	ble $t0, $t9, no_add20     # if (a <= b) goto no_add
	bge $t0, $t1, no_add20     # if (a >= b) goto no_add
	addi $t2, $t2, 20          # c += 20
	
	no_add20:
		andi $t1, $t1, 0xFF
