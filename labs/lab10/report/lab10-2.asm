		; Запись в файл строки введененой на запрос
%include 'in_out.asm'
SECTION .data
	filename db 'readme3.txt', 0h 				; Имя файла
	msg db 'Как вас зовут? ', 0h 				; Сообщение

SECTION .bss
	contents resb 255 					; переменная для вводимой строки
SECTION .text
global _start
_start:
		; Печать сообщения `msg`
	mov eax,msg
	call sprint
		; ---- Запись введеной с клавиатуры строки в `contents`
	mov ecx, contents
	mov edx, 255
	call sread
		; --- Открытие и создание файла (`sys_create`)
	mov ecx, 0777o 						; установка прав доступа
	mov ebx, filename					; имя создаваемого файла
	mov eax, 8						; номер системного вызова sys _create
	int 80h							;вызов ядра
		; --- Запись дескриптора файла в `esi`
	mov esi, eax
		; --- Расчет длины введенной строки
	mov eax, contents 					; в `eax` запишется количество
	call slen						 ; введенных байтов
		; --- Записываем в файл `contents` (`sys_write`)
	mov edx, eax
	mov ecx, contents
	mov ebx, esi
	mov eax, 4
	int 80h
		; --- Закрываем файл (`sys_close`)
	mov ebx, esi
	mov eax, 6
	int 80h
	call quit



