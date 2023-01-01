.text
.globl printString
.globl printChar
.globl readChar
.globl exit


printString:
	li a7, 4  # load a7 to print string
	ecall  # print the current string in a0
	ret  # return to the printsort file
	
printChar:
	li a7, 11  # load a7 with 11 to print characater
	ecall  # print the character in a0
	ret  # return to the printsort file
	
readChar:
	li a7, 12  # load a7 to read a char
	ecall  # take a char
	ret  #return to the printsort file
	
exit:
	li a7, 10  # load a7 to exit with code 0
	ecall