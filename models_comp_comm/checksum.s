# This MIPS program computes the checksum associated with
# the 10 fields of a IPv4 header.  The size of each field,
# however, has been reduced from 16bits to 8bits.
#
# The purpose of this program is to illustrate the various
# features of the MIPS ISA.  As part of this example, students
# have implemented the equivalent program in Java.


                .data
str1:           .ascii "Stored Checksum: \0"
str2:           .asciiz ", Computed Checksum: \0"
err_str:        .asciiz "Error Detected!\n\0"
                .eqv err_str_len 16


                .text
                .globl main
                # .include ""

                .macro exit(%reg)
                move $a0, %reg
                li $v0, 17
                syscall
                .end_macro


main:           jal checksum
                exit($v0)

checksum: 
                # Register Map for this subroutine
                #  $t0       # for ( int i=0;
                #  $t1       # final int max_int = 255;
                #  $t2       # int count = 10;        
                #  $t3       # int value = 0;         
                #  $t4       # int sum = 0;           
                #  $t5       # int checksum = 0;      
                #  $t6       # int quotient;  
                #  $t7       # int remainder; 
                #  $t8       # int complement;

                ########################################
                # Initialize our variables
                li $t1, 255                         # final int max_int = 255;
                li $t2, 10                          # int count = 10;        
                li $t3, 0                           # int value = 0;         
                li $t4, 0                           # int sum = 0;           
                li $t5, 0                           # int checksum = 0;      
                li $t6, 0                           # int quotient;  
                li $t7, 0                           # int remainder; 
                li $t8, 0                           # int complement;

                ########################################
                # Read in the IPv4 Header from stding
                li $t0, 1
     loop:      bgt $t0, 10, end_loop               #  for (int i=1 ; i <= count; i++) {
                  li $v0, 5                         #     value = stdin.nextInt();
                  syscall                           #
                  move  $t3, $v0                    #

                  bne $t0, 6, skip                  #     if (i == 6) {
                    move $t5, $t3                   #       checksum = value;
                    li $t3, 0                       #       value = 0;
                                                    #    }
     skip:        add $t4, $t4, $t3                 #    sum += value;
                  addi $t0, $t0, 1                      
                b loop                              #  }

     end_loop:  nop

                ########################################
                # Now perform the necessary computations
                addi $t0, $t1, 1                    # (max_int + 1)
                div $t4, $t0                        # hi, lo = sum / (max_int + 1)
                mflo $t6                            # quotient = lo
                mfhi $t7                            # remainder = hi
                add $t4, $t6, $t7                   # sum = quotient + remainder
                sub $t8, $t1, $t4                   # complement = max_int - sum

                ########################################
                # Output the message                # System.out.printf("Stored Checksum: %d, Computed Checksum: %d\n", checksum, complement);
                la $a0, str1                        ## print str1
                li $v0, 4
                syscall

                move $a0, $t5                       ## print_int checksum
                li $v0, 1
                syscall

                la $a0, str2                        ## printf str2
                li $v0, 4
                syscall

                move $a0, $t8                       ## print_int complement
                li $v0, 1
                syscall

                li $a0, '\n'                        ## print_char '\n'
                li $v0, 11
                syscall

                ########################################
                # Check if there was an error
                li $a0, 0                           # $a0 holds the return value of true
                
                # Check to see if there is an error
                beq $t5, $t8, done                  #  if (checksum != complement ) {
                   li $a0, 2                        # System.err.printf("Error Detected!\n"); 
                   la $a1, err_str
                   li $a2, err_str_len
                   li $v0, 15
                   syscall
                   li $a0, 1                        # $a0 holds the return value of false
     done:      nop
                jr $ra                              # return;


