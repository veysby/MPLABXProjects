PROCESSOR 16F1455

; PIC16F1455 Configuration Bit Settings

; Assembly source line config statements

#include <xc.inc>

; CONFIG1
/*
  CONFIG  FOSC = INTOSC         ; Oscillator Selection Bits (INTOSC oscillator: I/O function on CLKIN pin)
  CONFIG  WDTE = OFF            ; Watchdog Timer Enable (WDT disabled)
  CONFIG  PWRTE = OFF           ; Power-up Timer Enable (PWRT disabled)
  CONFIG  MCLRE = ON            ; MCLR Pin Function Select (MCLR/VPP pin function is MCLR)
  CONFIG  CP = OFF              ; Flash Program Memory Code Protection (Program memory code protection is disabled)
  CONFIG  BOREN = ON            ; Brown-out Reset Enable (Brown-out Reset enabled)
  CONFIG  CLKOUTEN = OFF        ; Clock Out Enable (CLKOUT function is disabled. I/O or oscillator function on the CLKOUT pin)
  CONFIG  IESO = ON             ; Internal/External Switchover Mode (Internal/External Switchover Mode is enabled)
  CONFIG  FCMEN = ON            ; Fail-Safe Clock Monitor Enable (Fail-Safe Clock Monitor is enabled)
*/
  CONFIG CONFIG1 = 0x3FE4

; CONFIG2
/*
  CONFIG  WRT = OFF             ; Flash Memory Self-Write Protection (Write protection off)
  CONFIG  CPUDIV = NOCLKDIV     ; CPU System Clock Selection Bit (NO CPU system divide)
  CONFIG  USBLSCLK = 48MHz      ; USB Low SPeed Clock Selection bit (System clock expects 48 MHz, FS/LS USB CLKENs divide-by is set to 8.)
  CONFIG  PLLMULT = 3x          ; PLL Multipler Selection Bit (3x Output Frequency Selected)
  CONFIG  PLLEN = DISABLED      ; PLL Enable Bit (3x or 4x PLL Disabled)
  CONFIG  STVREN = ON           ; Stack Overflow/Underflow Reset Enable (Stack Overflow or Underflow will cause a Reset)
  CONFIG  BORV = LO             ; Brown-out Reset Voltage Selection (Brown-out Reset Voltage (Vbor), low trip point selected.)
  CONFIG  LPBOR = OFF           ; Low-Power Brown Out Reset (Low-Power BOR is disabled)
  CONFIG  LVP = ON              ; Low-Voltage Programming Enable (Low-voltage programming enabled)
*/
  CONFIG CONFIG2 = 0x3ECF

PSECT code
  BANKSEL OSCCON
  movlw 00111110B
  BANKSEL TRISC
  clrf TRISC
  BANKSEL TRISA
  movlw 0xFF
  movwf TRISA
  BANKSEL LATC
  clrf LATC
loopy1:
  BANKSEL PORTA
  btfsc PORTA, 0
  call buttonpress
  goto loopy1
buttonpress:
  BANKSEL LATC
  incf LATC
  btfsc LATC, 4
  clrf LATC
buttonup:
  BANKSEL PORTA
  btfsc PORTA, 0
  goto buttonup
  return

    END
