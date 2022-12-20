; Write a program in the assembly language that computes the following arithmetic expression, considering the following data types for the variables:
; a - byte, b - byte, c - byte, d - byte
; I will solve the 23-th exercise from the additions and subtractions set
;(a-c)+(b+b+d)
; ex. 1: a = 10; b = 3; c = 5; d = 8 Result: (10-5)+(3+3+8) = 5 + 14 = 19
; 
bits 32 ;assembling for the 32 bits architecture
; the start label will be the entry point in the program
global  start 

extern  exit ; we inform the assembler that the exit symbol is foreign, i.e. it exists even if we won't be defining it

import  exit msvcrt.dll; exit is a function that ends the process, it is defined in msvcrt.dll
        ; msvcrt.dll contains exit, printf and all the other important C-runtime functions
segment  data use32 class=data ; the data segment where the variables are declared 
	a db 10
    b db 3
    c db 5
    d db 8
segment  code use32 class=code ; code segment
    start: 
        ;firstly i will consider calculating (a-c) -> 10 - 3
        mov AL, [a]
        mov BH, [c]
        sub AL, BH ; AL -> AL - BH = 10 - 5 (so we have the first result stored in AL)
        ;secondly, i will calculate the following parenthesis (b+b+d) -> (3+3+8) -> 14
        mov CL, [b]
        add CL, [b] ; CL + [b] -> CL : here we compute b+b -> 3+3 -> 6 (so now in CL we have 6 stored)
        add CL, [d] ; CL + [d] -> CL : here we compute (b+b+d) -> 6 + 8 -> 14 (so now in CL we have 14 stored
        ;lastly I will add up the 2 results from inside the parentheses calculated above
        add AL, CL ; AL -> AL + CL : (a-c)+(b+b+d) = 5 + 14 = 19(so now we have 19 stored in AL)
        
        
        
	
	push   dword 0 ;saves on stack the parameter of the function exit
	call   [exit] ; function exit is called in order to end the execution of