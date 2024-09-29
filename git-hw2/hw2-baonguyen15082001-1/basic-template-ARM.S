    // Start of text section           
    .text		// Text section contains code
    .global _start		// Define main label as a global entity
_start:
    nop
    
    // Start of data section
    // .word, .hword, .byte, .quad, .octa
    .data
v1: .word 0xDEADBEEF
v2: .hword 0x1234
v3: .byte 0xFF
