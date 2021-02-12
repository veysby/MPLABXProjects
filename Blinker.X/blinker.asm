PROCESSOR 16F1455

; PIC16F1455 Configuration Bit Settings

; Assembly source line config statements

#include <xc.inc>

; CONFIG1
/*
  CONFIG  FOSC = ECL            ; Oscillator Selection Bits (ECL, External Clock, Low Power Mode (0-0.5 MHz): device clock supplied to CLKIN pins)
  CONFIG  WDTE = OFF            ; Watchdog Timer Enable (WDT disabled)
  CONFIG  PWRTE = OFF           ; Power-up Timer Enable (PWRT disabled)
  CONFIG  MCLRE = ON            ; MCLR Pin Function Select (MCLR/VPP pin function is MCLR)
  CONFIG  CP = OFF              ; Flash Program Memory Code Protection (Program memory code protection is disabled)
  CONFIG  BOREN = ON            ; Brown-out Reset Enable (Brown-out Reset enabled)
  CONFIG  CLKOUTEN = OFF        ; Clock Out Enable (CLKOUT function is disabled. I/O or oscillator function on the CLKOUT pin)
  CONFIG  IESO = ON             ; Internal/External Switchover Mode (Internal/External Switchover Mode is enabled)
  CONFIG  FCMEN = OFF           ; Fail-Safe Clock Monitor Enable (Fail-Safe Clock Monitor is disabled)
*/
  CONFIG CONFIG1 = 0x1FE5

; CONFIG2
/*
  CONFIG  WRT = OFF             ; Flash Memory Self-Write Protection (Write protection off)
  CONFIG  CPUDIV = CLKDIV6      ; CPU System Clock Selection Bit (CPU system clock divided by 6)
  CONFIG  USBLSCLK = 48MHz      ; USB Low SPeed Clock Selection bit (System clock expects 48 MHz, FS/LS USB CLKENs divide-by is set to 8.)
  CONFIG  PLLMULT = 3x          ; PLL Multipler Selection Bit (3x Output Frequency Selected)
  CONFIG  PLLEN = ENABLED       ; PLL Enable Bit (3x or 4x PLL Enabled)
  CONFIG  STVREN = ON           ; Stack Overflow/Underflow Reset Enable (Stack Overflow or Underflow will cause a Reset)
  CONFIG  BORV = LO             ; Brown-out Reset Voltage Selection (Brown-out Reset Voltage (Vbor), low trip point selected.)
  CONFIG  LPBOR = OFF           ; Low-Power Brown Out Reset (Low-Power BOR is disabled)
  CONFIG  LVP = ON              ; Low-Voltage Programming Enable (Low-voltage programming enabled)
*/
  CONFIG CONFIG2 = 0x3FFF

PSECT code
  BANKSEL TRISC
  clrf TRISC
  BANKSEL LATC
loopy1:
  movlw 0xFF
  movwf LATC
  clrf LATC
  goto loopy1

  END