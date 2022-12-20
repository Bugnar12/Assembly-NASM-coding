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
    s2 db 1, 3, 7
    lensir2 equ $ - s2
    rez times lensir1 dw 0
segment  code use32 class=code ; code segment
    start: 
        mov ecx, lensir1
        mov esi, s1
        mov edi, rez
        cld
        jecxz the_end
        for:
            lodsb
            mov ah, 0
            stosw
        loop for
        ;In the high part of the array rez i have the array s1
        mov esi, s2
        mov edi, rez + 1
        mov ecx, lensir2
        cld
        jecxz the_end
        for2:
            lodsb
            stosb
        loop for2
        ;Now I want to put s2 in the high byte of rez
        
        
        
        the_end:
        ;exit(0)
        
        
	
	push   dword 0 ;saves on stack the parameter of the function exit
	call   [exit] ; function exit is called in order to end the execution of