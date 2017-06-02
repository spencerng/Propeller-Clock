; Propeller clock to display OTP
; RB7 is top, RB0 is bottom

MAIN_PROG CODE

START

#include <p16f887.inc>
 
COUNT EQU 0x20
ENTRIES EQU .21 ; however many entries for LEDs
 
 
reset:
    ORG 0x00
    GOTO setup
  	ORG 0x04
  	GOTO isr
  

setup:
    BANKSEL ANSELH
	CLRF ANSELH ; digital I/O
	BANKSEL TRISB
	CLRF TRISB ; all output
	BANKSEL PORTB
	MOVLW 0x00
	MOVWF COUNT
	
main:
	MOVF COUNT, 0
	CALL display
	MOVWF PORTB
	INCF COUNT
	MOVF COUNT, 0
	SUBLW ENTRIES 
	BTFSC STATUS, Z
	GOTO endOfDisplay
	GOTO main
	
endOfDisplay: ; one degree in 13 us (13 cycles)
	MOVLW .359
	SUBLW ENTRIES
	MOVWF COUNT
	loop: 
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		DECFSZ COUNT
		GOTO loop
	MOVLW .0
	MOVWF COUNT
	NOP
	NOP
	NOP
	NOP
	NOP
	RETURN
	
	
display:
	ADDWF PCL, F
	RETLW b'11111111'
	Retlw b'10000001'
	RETLW B'10000001'
	RETLW B'10000001'
	RETLW B'11111111'
	RETLW B'00000000'
	RETLW B'00000000'
	RETLW B'00000000'
	RETLW B'10000000'
	RETLW B'10000000'
	RETLW B'11111111'
	RETLW B'10000000'
	RETLW B'10000000'
	RETLW B'00000000'
	RETLW B'00000000'
	RETLW B'00000000'
	RETLW B'11111111'
	RETLW B'10010000'
	RETLW B'10010000'
	RETLW B'10010000'
	RETLW B'11110000'
	
		
oneDegreeDelay:
	RETURN
	
isr:
	NOP
	RETFIE
    
_end: 
    END