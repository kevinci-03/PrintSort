.text
.globl main

main:
	li	s1, '\0'
	li	a0, '\n'
	jal	printChar	#prints out new line
while2:
	la	a0, enter
	jal	printString		#prints enter statement
	la	a0, charArray	#loads character array
	jal	readString	#calls read string subroutine
if1:
	la	s0, charArray
	lw	a0, (s0)	#loads first item in array
	beq	a0, s1, endif1	#checks if first item in array is null
	la	a0, original
	jal	printString		#prints orignial message
while3:
	lw	a0, (s0)	#loads next item of the array
	beq	a0, s1 endwhile3	#checks if array character is null
	jal	printChar	#prints out array character 
	addi	s0, s0, 4
	b	while3
endwhile3:
	la	a0, alphabetizeMessage
	jal	printString		#prints alphabetized message
	la	a0, charArray	#loads an array
	jal	alphabetized	#calls alphabetized subroutine
	li	a0, '\n'
	jal	printChar	#prints out new line
	
endif1:
	b	while2		#infinite loop
	
#readString subroutine	
	
readString:
	li	t0, 0
	li	t1, 0
	mv	t3, a0		#puts array into temporary register
	sw	ra, svra, t2	#saves register to go back to main
while1:
	jal	readChar	#gets user character
	li	a1, '\n'
	beq	a0, a1, endwhile1	#checks if user character is new line
	sw	a0, (t3)	#saves user character to array
	addi	t3, t3, 4	#moves to next open spot
	b	while1
endwhile1:
	sw	s1, (t3)	#puts null character at the end of string
	lw	ra, svra	#loads register to go back to main
	ret
	
#alphabetized subroutine
	
alphabetized:
	li	t1, -1		#index variable
	li	t2, 0		#min variable
	mv	t3, a0		#str[count] variable
	mv	t4, a0		#str[i] variable
	lw	t6, (t4)	#first variable
	sw	ra, svra, a3	#saves register to go back to main
while4:
	lw	t5, (t3)	#grabs item from array
	beq	t5, s1, endwhile4	#checks if array item is null
	li	t0, 0		#sets i to 0
for1:
	lw	t5, (t4)	#grabs item from array
	beq	t5, s1, endfor1		#checks if str[i] is equal to null
if2:
	beq	t0, t1, endif2		#checks if i is equal to index
if3:
	bge	t5, t6, endif2		#checks if str[i] is greater than the current lowest ascii value in the list
	ble	t5, t2, endif2		#checks if str[i] is less than the current minimum threshhold
	mv	t6, t5		#changes first to str[i]
	mv	t1, t0		#changes index to i
endif2:
	addi	t0, t0, 1	#increments i
	addi	t4, t4, 4	#goes to next value in array
	b	for1
endfor1:
	li	t0, 0		#resets i to 0
	la	t4, charArray	#resets str[i] to begining of array
for2:
	lw	t5, (t4)	#grabs item from array
	beq	t5, s1, endfor2		#checks if item in array is equal to null character
if4:
	bne	t5, t6, endif4		#checks if item in array is not equal to current lowest ascii value
	mv	a0, t5
	jal	printChar	#prints out item in array
	addi	t3, t3, 4	#goes to next value in array
endif4:
	addi	t0, t0, 1	#increments i
	addi	t4, t4, 4	#goes to next value in array
	b	for2
endfor2:
	mv	t2, t6		#sets min to current lowest ascii value
	li	t6, 256		#sets to max ascii value
	la	t4, charArray	#resets str[i] to begining of array
	b	while4
endwhile4:
	lw	ra, svra	#loads register to go back to main
	ret
	
.data
enter:	.string		"Enter word: "
original: .string	"Original Word: "
alphabetizeMessage: .string	"\nAlphabetized Word: "
.align 2
charArray:	.space 80
.align 2
svra:	.word	-1
