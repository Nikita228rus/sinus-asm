.686
.model flat
.code

;prog-cpp.ru



_sumper proc ;процедура - функци€ в ассемблере
	mov eax, DWORD ptr[esp + 4]
	mov ebx, DWORD ptr[esp + 8]
	add eax, ebx
	mov ecx, esp
	ret ;возврат 
_sumper endp



_iteration proc
     mov ebx, dword ptr[esp + 4]

    cmp ebx, 0
    je zero
    jg not_zero
    zero:
        mov eax, 1

    not_zero:
        imul ebx, 2
        inc ebx
        mov eax, ebx
       ret
_iteration endp


_factorial proc
    mov eax, dword ptr[esp + 4]
    mov ebx, 1

    cmp eax, 1
    je return_1
    jmp factorial

    factorial:
    imul ebx, eax
    dec eax
    cmp eax, 1
    je return
    jmp factorial

    return_1:
    mov eax, 1
    ret 

    return:
    mov eax, ebx
    ret

_factorial endp



_sinus_asm proc

fild dword ptr[esp + 4]; тут фактариал
fld DWORD ptr[esp + 8]; тут угол x(float)
mov eax, dword ptr[esp + 12]; тут степень

fst dword ptr[esp - 4]; тут константа умножени€


cmp eax, 1
je devision
jmp degree

degree:
fmul dword ptr[esp - 4]
dec eax
cmp eax, 1
je devision
jmp degree

devision:
fdiv st(0), st(1)
ret
_sinus_asm endp






end ;указатель, где завершаетс€ трансл€ци€ программы
