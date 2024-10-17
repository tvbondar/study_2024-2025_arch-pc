; Программа вывода сообщений на экран и ввода с клавиатуры
%include 'in_out.asm' ; подключение внешнего файла
SECTION .data ; Секция инициированных данных
msg: DB 'Введите строку:',0h ;сообщение 
SECTION .bss ; секция неинициированных данных 
buf1: RESB 80 ;буфер размером 80 байт
SECTION .text ; код программы
GLOBAL _start ; начало программы
_start:     ; точка входа в программу
    mov eax, msg
    call sprint
    mov ecx, buf1
    mov edx, 80
    call sread
    mov eax, 4
    mov ebx, 1
    mov ecx, buf1
    int 80h
    call quit
