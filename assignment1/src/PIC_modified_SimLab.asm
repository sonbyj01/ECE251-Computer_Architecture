; ECE251 - Comp Arch
; Modified 8-bit counter
; Henry Son (@sonbyj01)
; Adjusted for PicSimLab
;
	LIST	P=PIC16F877A
	include <p16F877A.inc>

	__CONFIG _HS_OSC & _WDT_OFF & _PWRTE_ON & _CP_OFF & _LVP_OFF

COUNT	EQU	0x20		; General purpose registers used for variables
VAR_I	EQU	0x21
VAR_J	EQU	0x22
VAR_K	EQU	0x23

	ORG 0x00
	goto	start

	ORG 0x10
start
	bsf	STATUS ,RP0	; Bank 1
	movlw	0x00		; All bits output
	movwf	TRISD		; in PORTD
	movlw	0x06		; 1 and 2 are input
	movwf	TRISB		; in PORTB
	bcf	STATUS, RP0	; Bank 0

	clrf	COUNT		; Set COUNT to 0

L1	movf	COUNT, W	; Get value of COUNT
	movwf	PORTD		; and write it to PORTD
	btfss	PORTB,1		; 0 -> disable counter 
	goto L1
	
	btfss	PORTB,2		; 0 -> increment by 1
	incf	COUNT, F	; increment count by 1
	incf	COUNT, F
	
	movlw	0xFA		; ~250 ms delay
	call	DELAY
	goto	L1

DELAY	; subroutine delay for around ~1 ms
	; Stall
	movwf	VAR_I
	
L2		movlw	.200	; Number of iterations for inner loop
		movwf	VAR_J

L3			movlw	.5
			movwf	VAR_K
			
L4				nop	; Waste time : 10 cycles : 
				nop	; ~961 nano sec/L3cycle
				nop
				nop
				nop	
				nop
				nop
			
			decfsz VAR_K, F
			goto L4
			
		decfsz	VAR_J, F
		goto	L3

	decfsz	VAR_I, F
	goto	L2
	
	return
	
	END