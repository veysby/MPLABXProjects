
#include "mcc_generated_files/mcc.h"


void main(void)
{
    SYSTEM_Initialize();

    char state = 0b0000; // using char here as smallest available integer type

    while (1)
    {
        if (IO_RA0_GetValue() == HIGH) {
            do {
                __delay_ms(50);
            } while (IO_RA0_GetValue() == HIGH);

            if (state < 0b1111) {
                state += 0b0001;
            } else {
                state = 0b0000;
            }
        }

        if (state & 0b0001) {
            IO_RC0_SetHigh();
        } else {
            IO_RC0_SetLow();
        }

        if (state & 0b0010) {
            IO_RC1_SetHigh();
        } else {
            IO_RC1_SetLow();
        }

        if (state & 0b0100) {
            IO_RC2_SetHigh();
        } else {
            IO_RC2_SetLow();
        }

        if (state & 0b1000) {
            IO_RC3_SetHigh();
        } else {
            IO_RC3_SetLow();
        }
    }
}
