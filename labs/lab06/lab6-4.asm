;Программа вычисления выражения

%include 'in_out.asm' 		; подключение внешнего файла
SECTION .data
msg: DB 'Введите значение переменной x: ',0
rem: DB 'Результат: ',0

SECTION .bss	; секция неинициированных данных
x: RESB 80 	; Переменная, вводится с клавиатуры, выделенный размер - 80 байт

SECTION .text
GLOBAL _start
_start:
	
	; Вычисление выражения
mov eax,msg 	; EAX=выводимое сообщение
call sprint 
mov ecx, x 	; запись адреса переменной x в ecx
mov edx, 80 	; запись длины вводимого значения в edx 
call sread
mov eax,x	; вызов подпрограммы преобразования
call atoi	; ASCII кода в число, eax = x
mov ebx,8 	;ebx=8	
mul ebx		;eax = 8*x
add eax, -6	;eax= eax-6 = 8*x-6
mov ebx, 2	;запись значения 2 в регистр ebx
div ebx 	;eax=eax/ebx = (8*x - 6)/2
mov edi, eax	; запись результата вычисления в edi
	
	; Вывод результата на экран
mov eax,rem 	
call sprint 	
mov eax,edi 	
call iprintLF 	; из 'edi' в виде символов
call quit 	; вызов подпрограммы завершения

