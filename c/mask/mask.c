#include <stdio.h>

main()
{
    signed long NumberOfBits = 6;

    unsigned long Mask = ~(0x0);
    //printf("%lx\n", Mask);

    unsigned long Bits &= ~(Mask << NumberOfBits);
}
