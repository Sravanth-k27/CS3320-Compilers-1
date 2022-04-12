power:                                  # @power
        push    rbp
        mov     rbp, rsp
        mov     dword ptr [rbp - 8], edi
        mov     dword ptr [rbp - 12], esi
        mov     dword ptr [rbp - 16], 1
        cmp     dword ptr [rbp - 12], 0
        jne     .LBB0_2
        mov     dword ptr [rbp - 4], 1
        jmp     .LBB0_7
.LBB0_2:
        mov     dword ptr [rbp - 20], 1
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
        mov     eax, dword ptr [rbp - 20]
        mov     ecx, dword ptr [rbp - 12]
        add     ecx, 1
        cmp     eax, ecx
        jge     .LBB0_6
        mov     eax, dword ptr [rbp - 16]
        imul    eax, dword ptr [rbp - 8]
        mov     dword ptr [rbp - 16], eax
        mov     eax, dword ptr [rbp - 20]
        add     eax, 1
        mov     dword ptr [rbp - 20], eax
        jmp     .LBB0_3
.LBB0_6:
        mov     eax, dword ptr [rbp - 16]
        mov     dword ptr [rbp - 4], eax
.LBB0_7:
        mov     eax, dword ptr [rbp - 4]
        pop     rbp
        ret
sum_squares:                            # @sum_squares
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     dword ptr [rbp - 4], edi
        mov     dword ptr [rbp - 8], esi
        mov     edi, dword ptr [rbp - 4]
        mov     esi, 2
        call    power
        mov     dword ptr [rbp - 12], eax       # 4-byte Spill
        mov     edi, dword ptr [rbp - 8]
        mov     esi, 2
        call    power
        mov     ecx, eax
        mov     eax, dword ptr [rbp - 12]       # 4-byte Reload
        add     eax, ecx
        add     rsp, 16
        pop     rbp
        ret
main:                                   # @main
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     dword ptr [rbp - 4], 0
        mov     dword ptr [rbp - 20], 3
        mov     dword ptr [rbp - 24], 4
        mov     edi, dword ptr [rbp - 20]
        mov     esi, dword ptr [rbp - 24]
        call    sum_squares
        mov     dword ptr [rbp - 28], eax
        mov     esi, dword ptr [rbp - 28]
        movabs  rdi, offset .L.str
        mov     al, 0
        call    printf
        xor     eax, eax
        add     rsp, 48
        pop     rbp
        ret
.L.str:
        .asciz  "c: %d\n"