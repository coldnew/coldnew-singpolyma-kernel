

int main ()
{
	char *str = "Hello, World!\n";
	while(*str) {
		*(volatile char *) 0x101f1000 = *str;
		str++;
	}

	/* Prevent for exit */
	while(1);

	return 0;
}
