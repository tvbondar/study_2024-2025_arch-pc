%include 'in_out.asm'
section .data
msg1 db 'Введите x: ', 0h
msg2 db 'Введите a: ', 0h
msg3 db 'Результат: ', 0h
section .bss
x resb 11
a resb 11
res resb 12
section .text
global _start
_start:
    ; ---------- Вывод сообщения 'Введите x: '
mov eax, msg1
call sprint
    
    ; ---------- Ввод 'x'
mov ecx, x
mov edx, 10
call sread
    ; ---------- Преобразование 'x' из символа в число
mov eax, x
call atoi
mov [x], eax
    ; ---------- Вывод сообщения 'Введите a: '
mov eax, msg2
call sprint
    ; ---------- Ввод 'a'
mov ecx, a
mov edx, 10
call sread
    ; ---------- Преобразование 'a' из символа в число
mov eax, a
call atoi
mov [a], eax
    ; ---------- Сравниваем 'x' и '5'
mov eax, [x]  		; Загружаем значение 'x' в EAX
cmp eax, 5    		; Сравниваем EAX с 5
jl do_first  		; если 'x<5', то переход на метку 'do_first',
jge do_second 		; иначе переход на метку 'do_second'

do_first:
    mov eax, [x]  	; Загружаем значение 'x' в EAX
    mov ebx, [a]  	; Загружаем значение 'a' в EBX
    mul ebx       	; Умножаем EAX на EBX (x * a)
    mov ecx, eax  	; Переносим результат в ECX
    jmp fin

do_second:
    mov eax, [x]  	; Загружаем значение 'x' в EAX
    sub eax, 5    	; Вычитаем 5 из EAX
    mov ecx, eax  	; Переносим результат в ECX
    jmp fin

    ; ---------- Вывод результата
fin:
    mov eax, msg3
    call sprint  	; Вывод сообщения 'Результат: '
    mov eax, ecx  	; Переносим результат из ECX в EAX
    call iprintLF  	; Вывод 'x'
    call quit     	; Выход










	
	
	
	
