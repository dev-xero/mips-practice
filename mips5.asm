.data
name:        .space 50

name_prompt: .asciiz "What's your name? "
hello_space: .asciiz "Hello "
age_prompt:  .asciiz "How old are you? "
ask_height:  .asciiz "Enter your height in inches: "
age_height:  .asciiz "Your age + height = "

.text
main:
	li $v0, 4           # get ready to print with code 4
	la $a0, name_prompt # load address of string into a0
	syscall
	
	li $v0, 8           # get ready to read a string with
						# code 8
	la $a0, name        # address to store name
	li $a1, 50          # buffer size in a1
	syscall
	
	li $v0, 4           # get ready to print string
	la $a0, hello_space # load addr of string in a0
	syscall
	
	la $a0, name        # print name afterwards
	syscall
	
	la $a0, age_prompt  # print age prompt, v0 is still 4
	syscall
	
	li $v0, 5           # get ready to read an integer
	syscall
	move $t0, $v0       # save value in v0 in t0
	
	li $v0, 4           # get ready to print
	la $a0, ask_height  # load addr of string in a0
	syscall
	
	li $v0, 5           # get ready to read an integer
	syscall
	add $t0, $t0, $v0   # add height to age
	
	li $v0, 4           # get ready to print (code 4)
	la $a0, age_height  # addr of age + height string
	syscall
	
	li $v0, 1           # get ready to print an int
	move $a0, $t0       # a0 now has the value of t0
	syscall
	
	li $v0, 11          # get ready to print a char
	li $a0, 10          # ascii value of '\n'
	syscall
	
	li $v0, 10          # get ready to exit with code 10
	syscall