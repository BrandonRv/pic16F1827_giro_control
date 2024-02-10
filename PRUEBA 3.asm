;INICIALIZACION DEL PIC
;;;;;;;;;;;;;;;;;;;;;;;;
LIST P=16F1827          ;SELECCION DEL PIC
#INCLUDE "P16F1827.INC"     ;INCLUYE LAS PROPIEDADES INTERNAS DEL PIC
;;;;;;;;;;;;;;;;;;;;;;;;
;DEFINICION DE LAS POSICIONES DE MEMORIA 
;;;;;;;;;;;;;;;;;;;;;;;;
STATUS     EQU       03H
TRISA      EQU       8CH
TRISB      EQU       8DH
PORTA      EQU       0CH
PORTB      EQU       0DH
ANSELA     EQU       18CH
ANSELB     EQU       18DH
OSCTUNE    EQU       98H
OSCCON     EQU       99H
OSCSTAT    EQU       9AH
;;;;;;;;;;;;;;;;;;;;;;;;
;CONFIGURACION DEL PIC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;SE CONFIGURA EL PUERTOA DEL PIC 
;COMO ENTRADA DIGITAL Y EL PUERTO B
;COMO SALIDA DIGITAL Y LA FRECUENCIA
;DEL OSCILADOR INTERNO EN 4MHz 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CONFIGUR
           BANKSEL        ANSELA
           CLRF           ANSELA
           CLRF           ANSELB
           BANKSEL        TRISA
           MOVLW          B'11111111'
           MOVWF          TRISA
           CLRF           TRISB
           CLRF           OSCTUNE         
           MOVLW          B'00010000'
           MOVWF          OSCSTAT
           MOVLW          B'01101111'
           MOVWF          OSCCON    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;FUNCION QUE DESARROLLA EL PIC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
INICIO 
       
           BANKSEL        PORTA  
           BTFSC          PORTA,0
		   GOTO           START
		   BTFSC          PORTA,1
		   GOTO           STOP
		   BTFSC          PORTA,2
           GOTO           RIVERA
           GOTO           INICIO
           

START

 		   CLRF           PORTB,6
 		   CLRF           PORTB,7
		   BSF            PORTB,0
           GOTO           INICIO

STOP

 		   CLRF           PORTB
		   GOTO			  INICIO
RIVERA

 		   CLRF           PORTB,0
		   BSF            PORTB,6
           BSF            PORTB,7
           GOTO    		  INICIO
 
           
           END  

             

