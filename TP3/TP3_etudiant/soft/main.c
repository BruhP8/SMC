#include "stdio.h"

__attribute__((constructor)) void  main()
{
	char  byte;
	int i = 0;
	while(1) 
        {
            tty_printf("char count : %d\n, last char = %c\n", i, byte);
	    i++;
	    tty_getc(&byte);
	}

} // end main
