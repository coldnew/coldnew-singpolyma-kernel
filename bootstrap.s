
.global _start
_start:
	ldr sp, =0x7FFFFFF
	bl main
