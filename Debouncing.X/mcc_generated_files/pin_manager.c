
#include "pin_manager.h"


void PIN_MANAGER_Initialize(void)
{
    /**
    LATx registers
    */
    LATA = 0x00;
    LATC = 0x00;

    /**
    TRISx registers
    */
    TRISA = 0x30;
    TRISC = 0x30;

    /**
    ANSELx registers
    */
    ANSELC = 0x00;
    ANSELA = 0x10;

    /**
    WPUx registers
    */
    WPUA = 0x00;
    OPTION_REGbits.nWPUEN = 1;


    /**
    APFCONx registers
    */
    APFCON = 0x00;
}

