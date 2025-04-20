.data
name_prompt: .asciiz "What is your name? "
hello_msg:   .asciiz "Hello "
bang:        .asciiz "!"
name:        .space 50

.text
main:
	# =====================================================
	# === This program will ask the user for their name
	# === and print Hello [name]!
	# =====================================================
	li $v0, 4
	la $a0, name_prompt
	syscall
	
	# read name string
	li $v0, 8
	la $a0, name
	li $a1, 50
	syscall
	
	# attempt to remove the newline character
	la $t0, name
	strip_loop:
		lb $t1, 0($t0)         # load byte into t1
		beq $t1, 10, found_nl  # 10 is ascii for new line
		beqz $t1, done_strip   # if null terminator, stop
		addiu $t0, $t0, 1      # move to next char
		j strip_loop
	
	found_nl:
		sb $zero, 0($t0)       # overwrite newline with null
	
	done_strip:
	# print first segment of hello
	li $v0, 4
	la $a0, hello_msg
	syscall
	
	# print name
	la $a0, name
	syscall
	
	# print bang "!"
	la $a0, bang
	syscall
	
	# terminate gracefully
	li $v0, 10
	syscall
	