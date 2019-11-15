* = $C000
;.O
;.S
;.D V2.5 ML
;.P
;**********CLEAR ROUTINE*************
        LDA #$99
        STA $FA
        LDA #$3A
        STA $FB
        LDY #$00
        LDX #$00
LOOP1
        LDA #$20
        STA ($FA),Y
        INY
        CPY #$00
        BNE LOOP1
        INC $FB
        INX
        CPX #$64
        BNE LOOP1
        RTS
;**********SCROLL ROUTINE***********
        LDA #$00
        STA $FC
        LDA #$04
        STA $FD
        LDY #$00
        LDX #$00
LOOP2
        LDA ($FA),Y
        STA ($FC),Y
        INY
        CPY #$00
        BNE LOOP2
        INC $FB
        INC $FD
        INX
        CPX #$04
        BNE LOOP2
        RTS
;*********LOAD ROUTINE**************
        LDX #$08
        LDY #$FF
        LDA #$01
        JSR $FFBA
        LDA $03EF
        LDY #$03
        LDX #$F0
        JSR $FFBD
        LDA #$00
        LDX $97
        LDY $3A
        JSR $FFD5
        RTS
;*********SAVE ROUTINE**************
        JSR $AEFD
        JSR $AD9E
        JSR $B782
        LDX $22
        LDY $23
        JSR $FFBD
        JSR $B79B
        LDA #$02
        TAY
        JSR $FFBA
        JSR FOUND
        LDA $14
        STA $FB
        LDA $15
        STA $FC
        JSR FOUND
        LDX $14
        LDY $15
        LDA #$FB
        JMP $FFD8
FOUND
        JSR $AEFD
        JSR $AD9E
        JMP $B7F7
        BRK
;********INSERT ROUTINE*************
        LDA $FB
        CMP $FD
        BEQ FUR1
        BCC END1
        JMP START1
FUR1
        LDA $FA
        CMP $FC
        BCC END1
        JMP START1
END1
        RTS
START1
        LDY #$00
        LDA ($FA),Y
        LDY #$28
        STA ($FA),Y
        LDA $FA
        CMP $FC
        BNE DECR
        LDA $FB
        CMP $FD
        BNE DECR
        RTS
DECR
        DEC $FA
        LDA $FA
        CMP #$FF
        BEQ FIX1
        JMP START1
FIX1
        DEC $FB
        JMP START1
;*********DELETE ROUTINE***********
        LDA $FB
        CMP $FD
        BEQ FUR2
        BCC END2
        JMP START2
FUR2
        LDA $FA
        CMP $FC
        BCC END2
        JMP START2
END2
        RTS
START2
        LDY #$28
        LDA ($FC),Y
        LDY #$00
        STA ($FC),Y
        LDA $FA
        CMP $FC
        BNE INCR
        LDA $FB
        CMP $FD
        BNE INCR
        RTS
INCR
        INC $FC
        BEQ FIX2
        JMP START2
FIX2
        INC $FD
        JMP START2
