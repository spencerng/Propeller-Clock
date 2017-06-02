; Propeller clock to display OTP
; RB7 is top, RB0 is bottom

MAIN_PROG CODE

START

#include <p16f887.inc>
 
COUNT EQU 0x20
 
 
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
	CALL oneDegreeDelay
	INCF COUNT
	MOVF COUNT, 0
	SUBLW .20 ; however many entries for LEDs
	BTFSC STATUS, Z
	GOTO endOfDisplay
	GOTO main
	
endOfDisplay:
	MOVLW .270 ; however many degrees of blank space
	MOVWF COUNT
	loop: 
		CALL oneDegreeDelay
		DECFSZ COUNT
		GOTO loop
	MOVLW .0
	MOVWF COUNT
	RETURN
	
	
display:
	ADDWF PCL, F
	RETLW b'11101111'
	
	
	
oneDegreeDelay:
	RETURN
	
isr:
	NOP
	RETFIE
    
_end: 
    END