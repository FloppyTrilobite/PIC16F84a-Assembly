    processor 16F84A
    #include <P16F84A.INC>
    __config _CP_ON & _PWRTE_OFF & _WDT_OFF & _HS_OSC ; 0x216A

LRAM_0x20 equ 0x20
LRAM_0x21 equ 0x21
LRAM_0x22 equ 0x22
LRAM_0x23 equ 0x23
LRAM_0x24 equ 0x24
LRAM_0x25 equ 0x25
LRAM_0x26 equ 0x26

    Org 0x0000

    GOTO LADR_0x0016

    Org 0x0003

LADR_0x0003
    BCF STATUS,RP0      

    BCF STATUS,RP1       
    MOVF LRAM_0x23,W
    MOVWF PCLATH        
    MOVF LRAM_0x22,W
    MOVWF PCL            
    RETURN
LADR_0x000A
    CALL LADR_0x0003
    BCF PCLATH,3         
    BCF PCLATH,4         
    MOVWF INDF
    INCF FSR,F
    INCF LRAM_0x22,F
    BTFSC STATUS,Z
    INCF LRAM_0x23,F
    DECF LRAM_0x70,F
    BTFSS STATUS,Z
    GOTO LADR_0x000A
    RETURN
LADR_0x0016
    BCF STATUS,RP0       
    BCF STATUS,RP1       
    CLRF LRAM_0x20
    CLRF LRAM_0x21
    MOVLW 0xFE           ;   b'11111110'  d'254'
    BSF STATUS,RP0       
    MOVWF PORTA          
    CLRF PORTB           
LADR_0x001E
    MOVLW 0x80           ;   b'10000000'  d'128'
    BCF STATUS,RP0       
    XORWF LRAM_0x21,W
    MOVWF LRAM_0x70
    MOVLW 0x80           ;   b'10000000'  d'128'
    SUBWF LRAM_0x70,W
    BTFSS STATUS,Z
    GOTO LADR_0x0028
    MOVLW 0x63           ;   b'01100011'  d'099'  "c"
    SUBWF LRAM_0x20,W
LADR_0x0028
    BTFSS STATUS,C
    GOTO LADR_0x002E
    MOVLW 0x02           ;   b'00000010'  d'002'
    MOVWF LRAM_0x24
    CLRF LRAM_0x25
    GOTO LADR_0x002F
LADR_0x002E
    CLRF LRAM_0x24
LADR_0x002F
    MOVLW 0x80           ;   b'10000000'  d'128'
    XORWF LRAM_0x21,W
    MOVWF LRAM_0x70
    MOVLW 0x80           ;   b'10000000'  d'128'
    SUBWF LRAM_0x70,W
    BTFSS STATUS,Z
    GOTO LADR_0x0038
    MOVLW 0x4B           ;   b'01001011'  d'075'  "K"
    SUBWF LRAM_0x20,W
LADR_0x0038
    BTFSS STATUS,C
    GOTO LADR_0x003D
    MOVLW 0x04           ;   b'00000100'  d'004'
    MOVWF LRAM_0x26
    GOTO LADR_0x0040
LADR_0x003D
    CLRF LRAM_0x26
    MOVLW 0x01           ;   b'00000001'  d'001'
    MOVWF LRAM_0x25
LADR_0x0040
    MOVF LRAM_0x25,W
    XORLW 0x01           ;   b'00000001'  d'001'
    BTFSS STATUS,Z
    GOTO LADR_0x005F
    MOVLW 0x03           ;   b'00000011'  d'003'
    ADDWF LRAM_0x20,W
    MOVWF LRAM_0x71
    MOVF LRAM_0x21,W
    BTFSC STATUS,C
    ADDLW 0x01           ;   b'00000001'  d'001'
    MOVWF LRAM_0x72
    MOVLW 0x80           ;   b'10000000'  d'128'
    MOVWF LRAM_0x70
    MOVLW 0x80           ;   b'10000000'  d'128'
    XORWF LRAM_0x72,W
    SUBWF LRAM_0x70,W
    BTFSS STATUS,Z
    GOTO LADR_0x0054
    MOVF LRAM_0x71,W
    SUBLW 0x64           ;   b'01100100'  d'100'  "d"
LADR_0x0054
    BTFSC STATUS,C
    GOTO LADR_0x005B
    MOVLW 0x64           ;   b'01100100'  d'100'  "d"
    MOVWF LRAM_0x20
    MOVLW 0x00           ;   b'00000000'  d'000'
    MOVWF LRAM_0x21
    GOTO LADR_0x005F
LADR_0x005B
    MOVLW 0x03           ;   b'00000011'  d'003'
    ADDWF LRAM_0x20,F
    BTFSC STATUS,C
    INCF LRAM_0x21,F
LADR_0x005F
    MOVLW 0x01           ;   b'00000001'  d'001'
    SUBWF LRAM_0x20,F
    BTFSS STATUS,C
    DECF LRAM_0x21,F
    MOVF LRAM_0x24,W
    ADDWF LRAM_0x25,W
    MOVWF LRAM_0x70
    MOVF LRAM_0x26,W
    ADDWF LRAM_0x70,W
    MOVWF PORTB          
    MOVLW 0x04           ;   b'00000100'  d'004'
    MOVWF LRAM_0x7B
    MOVLW 0xCF           ;   b'11001111'  d'207'
    MOVWF LRAM_0x7C
    MOVLW 0x01           ;   b'00000001'  d'001'
    MOVWF LRAM_0x7D
LADR_0x006F
    DECFSZ LRAM_0x7D,F
    GOTO LADR_0x006F
    DECFSZ LRAM_0x7C,F
    GOTO LADR_0x006F
    DECFSZ LRAM_0x7B,F
    GOTO LADR_0x006F
    NOP
    NOP
    GOTO LADR_0x001E
LADR_0x0078
    GOTO LADR_0x0078

    End
