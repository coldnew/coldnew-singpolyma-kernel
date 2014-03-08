
#include "versatilepb.h"
#include "asm.h"

void bwputs(char *s)
{
	while(*s) {
		while (*(UART0 + UARTFR) & UARTFR_TXFF);
		*UART0 = *s;
		s++;
	}
}

void first()
{
	bwputs("In user mode\n");
	while (1);
}

int main ()
{
	bwputs("Starting kernel!\n");
	activate();

	/* Prevent for exit */
	while(1);
	return 0;
}
