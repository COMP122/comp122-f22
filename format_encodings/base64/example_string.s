
                .data
str:            .ascii "This is a string used "
                .ascii "to demonstrate "
                .ascii "Endianness.\n\0" 

                .text
                .globl main


main:           nop
                la $a0, str     # a0 contains the address of str
                li $v0, 4       # v0 contains the number for print_s, 4
                syscall         # trap: print_s(str)

                li $a0, 0       # a0 contains the return value        
                li $v0, 17      # v0 contains the number for exiti, 17
                syscall         # trap: exit
        
        



        
