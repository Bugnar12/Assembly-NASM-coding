; Write a program in the assembly language that computes the following arithmetic expression, considering the following data types for the variables:
; I will solve the 23-th exercise from the additions and subtractions set 2
; a - byte, b - byte, c - byte, d - byte
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
	s1 db 2, 4, 2, 5, 2, 2, 4, 4 
    lensir1 equ $ - s1 ;the length of the initial string of BYTES
    rez times lensir1 dw 0
segment  code use32 class=code ; code segment
    start: 
        ;put the number of appearences of the number 2 in the high byte of a word
        mov ecx, lensir1
        mov esi, s1
        cld
        jecxz the_end
        for:
            lodsb
            mov bl, 2
            cmp al, bl
            je adding
            jecxz the_end
        loop for
        
        adding:
            inc dl
            dec ecx
            jmp for
        ;In the high part of the array rez i have the array s1
        
        
        
        
        the_end:
        ;exit(0)
        
        
	
	push   dword 0 ;saves on stack the parameter of the function exit
	call   [exit] ; function exit is called in order to end the execution of