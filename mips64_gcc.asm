power:
        daddiu  $sp,$sp,-48
        sd      $fp,40($sp)
        move    $fp,$sp
        move    $3,$4
        move    $2,$5
        sll     $3,$3,0
        sw      $3,16($fp)
        sll     $2,$2,0
        sw      $2,20($fp)
        li      $2,1                        # 0x1
        sw      $2,0($fp)
        lw      $2,20($fp)
        bne     $2,$0,.L2
        nop

        li      $2,1                        # 0x1
        b       .L3
        nop

.L2:
        li      $2,1                        # 0x1
        sw      $2,4($fp)
        b       .L4
        nop

.L5:
        lw      $3,0($fp)
        lw      $2,16($fp)
        mult    $3,$2
        mflo    $2
        sw      $2,0($fp)
        lw      $2,4($fp)
        addiu   $2,$2,1
        sw      $2,4($fp)
.L4:
        lw      $3,20($fp)
        lw      $2,4($fp)
        slt     $2,$3,$2
        beq     $2,$0,.L5
        nop

        lw      $2,0($fp)
.L3:
        move    $sp,$fp
        ld      $fp,40($sp)
        daddiu  $sp,$sp,48
        jr      $31
        nop

sum_squares:
        daddiu  $sp,$sp,-48
        sd      $31,40($sp)
        sd      $fp,32($sp)
        sd      $28,24($sp)
        sd      $16,16($sp)
        move    $fp,$sp
        lui     $28,%hi(%neg(%gp_rel(sum_squares)))
        daddu   $28,$28,$25
        daddiu  $28,$28,%lo(%neg(%gp_rel(sum_squares)))
        move    $3,$4
        move    $2,$5
        sll     $3,$3,0
        sw      $3,0($fp)
        sll     $2,$2,0
        sw      $2,4($fp)
        lw      $2,0($fp)
        li      $5,2                        # 0x2
        move    $4,$2
        ld      $2,%got_disp(power)($28)
        mtlo    $2
        mflo    $25
        jalr    $25
        nop

        move    $16,$2
        lw      $2,4($fp)
        li      $5,2                        # 0x2
        move    $4,$2
        ld      $2,%got_disp(power)($28)
        mtlo    $2
        mflo    $25
        jalr    $25
        nop

        addu    $2,$16,$2
        move    $sp,$fp
        ld      $31,40($sp)
        ld      $fp,32($sp)
        ld      $28,24($sp)
        ld      $16,16($sp)
        daddiu  $sp,$sp,48
        jr      $31
        nop

.LC0:
        .ascii  "c: %d\012\000"
main:
        daddiu  $sp,$sp,-64
        sd      $31,56($sp)
        sd      $fp,48($sp)
        sd      $28,40($sp)
        move    $fp,$sp
        lui     $28,%hi(%neg(%gp_rel(main)))
        daddu   $28,$28,$25
        daddiu  $28,$28,%lo(%neg(%gp_rel(main)))
        li      $2,3                        # 0x3
        sw      $2,0($fp)
        li      $2,4                        # 0x4
        sw      $2,4($fp)
        lw      $3,4($fp)
        lw      $2,0($fp)
        move    $5,$3
        move    $4,$2
        ld      $2,%got_disp(sum_squares)($28)
        mtlo    $2
        mflo    $25
        jalr    $25
        nop

        sw      $2,8($fp)
        lw      $4,16($fp)
        lw      $3,12($fp)
        lw      $2,8($fp)
        move    $7,$4
        move    $6,$3
        move    $5,$2
        ld      $2,%got_page(.LC0)($28)
        daddiu  $4,$2,%got_ofst(.LC0)
        ld      $2,%call16(printf)($28)
        mtlo    $2
        mflo    $25
        jalr    $25
        nop

        move    $2,$0
        move    $sp,$fp
        ld      $31,56($sp)
        ld      $fp,48($sp)
        ld      $28,40($sp)
        daddiu  $sp,$sp,64
        jr      $31
        nop