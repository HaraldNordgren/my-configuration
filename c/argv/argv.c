#include <stdio.h>

main(const int argc,
     const char *argv_pp[])
{
    int i;

    for (i=1; i < argc; i++) {
        printf("%c\n", *(argv_pp[i]));
        printf("%s\n\n", argv_pp[i]);
    }
}
