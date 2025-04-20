.data
golden: .float 1.618

price_prompt:  .asciiz "\nEnter what the price of gas was last time you filled up: "
too_expensive: .asciiz " is too expensive!\n"
golden_msg:    .asciiz "\nThe goldren ratio is roughly "
ret_prompt:    .asciiz "\nEnter an integer for the program to return: "

.text
main:
	# ================================================================
	# ===== This segment will read a float and print and print it out
	# ====== with a message
	# ================================================================
	li $v0, 4             # get ready to print string
	la $a0, price_prompt  # load addr of str into a0
	syscall
	
	li $v0, 6             # get ready to read a float
	syscall               # read float
	
	li $v0, 2             # get ready to print a float (code 2)
	mov.s $f12, $f0       # mov.s (single point - float) we read from f0 into f12
	syscall

	li $v0, 4             # get ready to print a string
	la $a0, too_expensive # load addr of string in a0
	syscall
	
	# ================================================================
	# ===== This segment will print out the golden ratio along with a
	# ====== message
	# ================================================================
	li $v0, 4             # get ready to print string
	la $a0, golden_msg    # addr of golden msg in a0
	syscall
	
	li $v0, 2            # get ready to print float
	l.s $f12, golden     # we use f12 for storing floats!
	syscall
	
	# ================================================================
	# ===== This segment will ask the user for a return value
	# ================================================================
	li $v0, 4            # get ready to print string
	la $a0, ret_prompt   # load addr of ret prompt into a0
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	move $v0, $t0
	
	li $v0, 10           # get ready to exit the program
	syscall
	
