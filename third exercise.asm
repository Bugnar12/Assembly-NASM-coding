; Write a program in the assembly language that computes the following arithmetic expression, considering the following data types for the variables:
; I will solve the 23-th exercise from the additions and subtractions set 2
; a - word, b - word, c - word, d - word
; (a + b + c) - (d + d)
; ex. 1: a = 30; b = 10; c = 50; d = 20 Result: (30 + 10 + 50) - (20 + 20) = 50
; 
bits 32 ;assembling for the 32 bits architecture
; the start label will be the entry point in the program
global  start 

extern  exit ; we inform the assembler that the exit symbol is foreign, i.e. it exists even if we won't be defining it

import  exit msvcrt.dll; exit is a function that ends the process, it is defined in msvcrt.dll
        ; msvcrt.dll contains exit, printf and all the other important C-runtime functions
segment  data use32 class=data ; the data segment where the variables are declared 
	a dw 30
    b dw 10
    c dw 50
    d dw 20
segment  code use32 class=code ; code segment
    start: 
        ;First of all, I will take the first parenthesis and compute it : (a + b + c) = (30 + 10 + 50)
        mov AX, [a]
        add AX, [b] ;AX <- AX + [b] = 30 + 10 = 40
        add AX, [c] ;AX <- AX + [c] = 40 + 50 = 90
        ;Second of all, I will take the second parenthesis and compute it : (d + d) = (20 + 20)
        mov BX, [d]
        add BX, [d] ;DX <- DX + [d] = 20 + 20 = 40
        ;Last of all, I will subtract the result computed from the second parenthesis from the result obtained in the first one and that will be the final result
        sub AX, BX ; AX <- AX - BX = 90 - 40 = 50 (the final result is stored in register AX)
        
        
        
	
	push   dword 0 ;saves on stack the parameter of the function exit
	call   [exit] ; function exit is called in order to end the execution of