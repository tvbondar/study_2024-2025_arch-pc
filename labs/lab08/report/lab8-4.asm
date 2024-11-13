;Листинг 8.3. Программа вычисления суммы значений функции f(x)=15x-9 
%include 'in_out.asm'
SECTION .data
msg1 db "Функция: f(x)=15x-9 ",0
msg2 db "Результат: ",0
SECTION .text
global _start
_start:
	pop ecx 	; Извлекаем из стека в `ecx` количество аргументов (первое значение в стеке)
	pop edx 	; Извлекаем из стека в `edx` имя программы (второе значение в стеке)
	sub ecx,1 	; Уменьшаем `ecx` на 1 (количество аргументов без названия программы)
	mov esi, 0 	; Используем `esi` для хранения промежуточных сумм
next:
	cmp ecx,0h 	; проверяем, есть ли еще аргументы
	jz _end 	; если аргументов нет выходим из цикла (переход на метку `_end`)
	pop eax 	; иначе извлекаем следующий аргумент из стека
	call atoi 	; преобразуем символ в число
	mov ebx, 15	
	mul ebx		; умножаем переменную на 15 `eax=15*eax`
	sub eax, 9 	;уменьшаем значение на 9
	add esi, eax	; возвращаем результат в esi
	loop next 	; переход к обработке следующего аргумента
_end:
	mov eax, msg1 	; вывод первого сообщения
	call sprint
	mov eax, msg2	; вывод второго сообщения
	call sprint
	mov eax, esi 	; записываем сумму в регистр `eax`
	call iprintLF 	; печать результата
	call quit 	; завершение программы
