
;Written by: UMUTONI Gaelle & UKWITEGETSE Jean de Dieu
    
    
; PIC16F877A Configuration Bit Settings

; Assembly source line config statements

#include "p16f877a.inc"

; CONFIG
; __config 0xFFFF
 __CONFIG _FOSC_EXTRC & _WDTE_OFF & _PWRTE_ON & _BOREN_ON & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF
    
;initializing
 STATUS equ 03h ;for selecting bank
 RP0 equ 05
 RP1 equ 06
 PORTD equ 08h ;bank 0
 TRISD equ 88h ;bank 1
 COUNTER equ 20h ;counter for our delay loop
 
;program starts
 org 00h
 clrw ;clear w register
 
;selecting bank0
 BCF STATUS,RP0 ;RP0=0
 BCF STATUS,RP1 ;RP1=0
 
 CLRF PORTD
 
;selecting bank1
 BSF STATUS,RP0 ;RP0=1
 
 CLRF TRISD
 
 MOVLW 0x00
 MOVWF TRISD ;setting PORTD as output
 
;back to bank0
 BCF STATUS,RP0 ;RP0=0
 
START MOVLW 0x01
      MOVWF PORTD ;turn on only first pin on PORTD
	
      MOVLW 0xff
      MOVWF COUNTER ;setting the counter
	
LOOP1 DECFSZ COUNTER,1 ;decrement by 1,until 0
      GOTO LOOP1
    
    MOVLW 0x02
    MOVWF PORTD ;turn on only second pin on PORTD
     
    MOVLW 0xff
    MOVWF COUNTER ;setting the counter again
    
LOOP2 DECFSZ COUNTER,1 ;decrement by 1,until 0
      GOTO LOOP2
      
    MOVLW 0x04
    MOVWF PORTD ;turn on only third pin on PORTD
     
    MOVLW 0xff
    MOVWF COUNTER ;setting the counter again
    
LOOP3 DECFSZ COUNTER,1 ;decrement by 1,until 0
      GOTO LOOP3
     
    GOTO START
END
