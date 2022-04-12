power:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-20], edi
        mov     DWORD PTR [rbp-24], esi
        mov     DWORD PTR [rbp-4], 1
        cmp     DWORD PTR [rbp-24], 0
        jne     .L2
        mov     eax, 1
        jmp     .L3
.L2:
        mov     DWORD PTR [rbp-8], 1
        jmp     .L4
.L5:
        mov     eax, DWORD PTR [rbp-4]
        imul    eax, DWORD PTR [rbp-20]
        mov     DWORD PTR [rbp-4], eax
        add     DWORD PTR [rbp-8], 1
.L4:
        mov     eax, DWORD PTR [rbp-24]
        cmp     eax, DWORD PTR [rbp-8]
        jge     .L5
        mov     eax, DWORD PTR [rbp-4]
.L3:
        pop     rbp
        ret
sum_squares:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 8
        mov     DWORD PTR [rbp-12], edi
        mov     DWORD PTR [rbp-16], esi
        mov     eax, DWORD PTR [rbp-12]
        mov     esi, 2
        mov     edi, eax
        call    power
        mov     ebx, eax
        mov     eax, DWORD PTR [rbp-16]
        mov     esi, 2
        mov     edi, eax
        call    power
        add     eax, ebx
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
.LC0:
        .string "c: %d\n"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     DWORD PTR [rbp-4], 3
        mov     DWORD PTR [rbp-8], 4
        mov     edx, DWORD PTR [rbp-8]
        mov     eax, DWORD PTR [rbp-4]
        mov     esi, edx
        mov     edi, eax
        call    sum_squares
        mov     DWORD PTR [rbp-12], eax
        mov     ecx, DWORD PTR [rbp-20]
        mov     edx, DWORD PTR [rbp-16]
        mov     eax, DWORD PTR [rbp-12]
        mov     esi, eax
        mov     edi, OFFSET FLAT:.LC0
        mov     eax, 0
        call    printf
        mov     eax, 0
        leave
        ret