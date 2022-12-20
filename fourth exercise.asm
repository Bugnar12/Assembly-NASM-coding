; Write a program in the assembly language that computes the following arithmetic expression, considering the following data types for the variables:
; I will solve the 23-th exercise from the multiplications and divisions set 1
; a - byte, b - byte, c - byte, d - word
; [(a+b)*2]/(a+d)
; ex. 1: 
; 
bits 32 ;assembling for the 32 bits architecture
; the start label will be the entry point in the program
global  start 

extern  exit ; we inform the assembler that the exit symbol is foreign, i.e. it exists even if we won't be defining it

import  exit msvcrt.dll; exit is a function that ends the process, it is defined in msvcrt.dll
        ; msvcrt.dll contains exit, printf and all the other important C-runtime functions
segment  data use32 class=data ; the data segment where the variables are declared 
	a db 5
    b db 10
    d db 5
segment  code use32 class=code ; code segment
    start: 
    
        ;firstly I will add up a and b to solve the first parenthesis
        mov AL, [a]
        add AL, [b] ;now in AL we have the result from (a+b) = 15
        mov BH, 2
        mul BH ; AX <- AL * BH = (a+b)*2 stored in AX
        mov BX, AX ; we move AX into BX so we can calculate the next expression in AX
        mov CL, [a]
		add CL, [d] ; CL -> a + d
		sub CL ;AL -> AX / CL
        
        
        

	push   dword 0 ;saves on stack the parameter of the function exit
	call   [exit] ; function exit is called in order to end the execution of