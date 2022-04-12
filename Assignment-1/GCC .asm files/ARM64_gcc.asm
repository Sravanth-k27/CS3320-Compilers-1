power:
        sub     sp, sp, #32
        str     w0, [sp, 12]
        str     w1, [sp, 8]
        mov     w0, 1
        str     w0, [sp, 28]
        ldr     w0, [sp, 8]
        cmp     w0, 0
        bne     .L2
        mov     w0, 1
        b       .L3
.L2:
        mov     w0, 1
        str     w0, [sp, 24]
        b       .L4
.L5:
        ldr     w1, [sp, 28]
        ldr     w0, [sp, 12]
        mul     w0, w1, w0
        str     w0, [sp, 28]
        ldr     w0, [sp, 24]
        add     w0, w0, 1
        str     w0, [sp, 24]
.L4:
        ldr     w1, [sp, 8]
        ldr     w0, [sp, 24]
        cmp     w1, w0
        bge     .L5
        ldr     w0, [sp, 28]
.L3:
        add     sp, sp, 32
        ret
sum_squares:
        stp     x29, x30, [sp, -48]!
        mov     x29, sp
        str     x19, [sp, 16]
        str     w0, [sp, 44]
        str     w1, [sp, 40]
        mov     w1, 2
        ldr     w0, [sp, 44]
        bl      power
        mov     w19, w0
        mov     w1, 2
        ldr     w0, [sp, 40]
        bl      power
        add     w0, w19, w0
        ldr     x19, [sp, 16]
        ldp     x29, x30, [sp], 48
        ret
.LC0:
        .string "c: %d\n"
main:
        stp     x29, x30, [sp, -48]!
        mov     x29, sp
        mov     w0, 3
        str     w0, [sp, 44]
        mov     w0, 4
        str     w0, [sp, 40]
        ldr     w1, [sp, 40]
        ldr     w0, [sp, 44]
        bl      sum_squares
        str     w0, [sp, 36]
        ldr     w3, [sp, 28]
        ldr     w2, [sp, 32]
        ldr     w1, [sp, 36]
        adrp    x0, .LC0
        add     x0, x0, :lo12:.LC0
        bl      printf
        mov     w0, 0
        ldp     x29, x30, [sp], 48
        ret