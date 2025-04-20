.data
age:         .word 0
ask_name:    .asciiz "What is your name and age?\n"
hello_space: .asciiz "Hello "
nice_meet:   .asciiz ", nice to meet you!\n"
name:        .space 30

.text
main:
	# Print question asking about age
	li $v0, 4
	la $a0, ask_name
	syscall
	
	# Read name string
	li $v0, 8
	la $a0, name
	syscall
	
	# Clean up new lines from name input
	la $t0, name
	loop:
		lb $t1, 0($t0)
		beqz $t1, done
		li $t2, 10 # ascii value of '\n'
		beq $t1, $t2, replace
		addi $t0, $t0, 1
		j loop
		
	replace:
		sb $zero, 0($t0)
	
done:
	# Print hello_space string
	li $v0, 4
	la $a0, hello_space
	syscall
	
	# Print name string
	li $v0, 4
	la $a0, name
	syscall
	
	# Print nice to meet you string
	li $v0, 4
	la $a0, nice_meet
	syscall
	
	# Exit syscall, close the program
	li $v0, 10
	syscall