; specify equivalent symbols
.equ SREG, 0x3F
.equ PORTB, 0x05
.equ DDRB, 0x04
.equ PORTD, 0x0B
.equ DDRD, 0x0A


; specify the start address
.org 0

; ...
main:   	clr r16 
		    out SREG, r16

		    ldi r16, 0x0F ; sets r16 to 0x0F which represents 0000 1111 (binary).
		    out DDRB, r16 ; sets bits 0,1,2 and 3 of DDRD to output mode, i.e. value 1.

		    ldi r16, 0xF0 ; sets r16 to 0xF0 which represents 1111 0000 (binary).
		    out DDRD, r16 ; sets bits 4,5,6 and 7 of DDRD to output mode, i.e. value 1.

		    main_loop:              ldi r16, 0x81
		                            call out
		                            
		                            call delay
		                            
		                            ; isolate lower nybble
		                            ldi r17, 0x0F
		                            and r17, r16
		                            
		                            ; isolate upper nybble
		                            ldi r18, 0xF0
		                            and r18, r16
		                            
                                    call update_r16
                                    
                                    call out
									
		                            call delay
                                    
                                    brne main_loop


; Subroutines
delay:      ldi r22, 0x32
            ldi r20, 0x68
            ldi r21, 0xDF
            delay_loop:             dec r21
                                    brne delay_loop
                                    dec r20
                                    brne delay_loop
                                    dec r22
                                    brne delay_loop
            ret

lsl:        lsl r17
            lsl r17
            lsl r17
            lsl r17
            ret
            
lsr:        lsr r18
            lsr r18
            lsr r18
            lsr r18
		    ret

update_r16: call lsl
            call lsr
            clr r16
            or r16, r17
            or r16, r18
            ret

out:        out PORTB, r16
            out PORTD, r16
            ret


; Oluwafemi Oladipo
; K1456646
;
; Switch between displaying byte 0x81 and 0x18.