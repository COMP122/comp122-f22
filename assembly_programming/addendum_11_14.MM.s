                .globl encode_binary32
                .include "macros/syscalls.s"


                # The following is test input to help you in your initial debugging
                li $a0, '+'    # 0x2b (43)
                li $a1, 0x34E1 # (0011 0100 1110 0001) 
                li $a2, '-'    # 0x2d   (45)
                li $a3, 0x29   # (41)

   .macro position_of_msb(%reg)
              li $a0, 0                #        counter = 0;
              move $a1, %reg           #        number = %reg;
        loop: beq $a1, $zero, done     # loop:  for(; number != zero ;) {
                addi $a0, $a0, 1       #           counter ++;
                srl $a1, $a1, 1        #           number = number >> 1;
              b loop                   #           break loop;
                                       #        }
        done: nop                      # done:  nop
              move $v0, $a0            #        $v0 = counter;
    .end_macro
  

encode_binary32: nop
                # Prototype:  encode_binary32( sign, number, expon_sign, expon )
                # Formal Parameters:
                # a0: sign -- an ASCII character
                # a1: number (representing, in total,:  1.\<mantissa\>) 
                # a2: expon_sign -- an ASCII character
                # a3: exponent (unbiased)
                # v0: the encoded binary32 value
        
                # t0: sign
                # t1: number, mantissa
                # t2: expon_sign
                # t3: exponent
                # t4: final
        
                # Demarshal your input arguments


                # Decode and then encode the sign
                if (sign == '+') { sign = 0;}
                if (sign == '-') { sign = 1;}

                # Obtain the mantissa, by left-justifying the number while dropping the leading 1
                # - shift the number to the left the appropriate number of positions
                # - use the `position_of_msb` macro to determine this number 
                $v0 = position_of_msb(number)
                amount = 32 - $v0 + 1;
                mantissa = number << amount;

                # Decode the sign of the exponent and then re-encode the exponent
                if (expon_sign == '+') { 
                        expon_sign = 0;
                        expon = expon;
                }
                if (expon_sign == '-') { 
                        expon_sign = 1;
                        expon = ~ expon + 1;

                }

                # Add the bias to the exponent
                expon = expon + 127;

                # Shift the pieces into place: sign, exponent, mantissa
                sign = sign << 31 ;
                expon = expon << 23  ;
                mantissa = mantissa >> 9 ;   // 1 + 8
 
                # Merge the pieces together
                final = sign | expon | mantissa;


                # Call `print_t` to print the value as a bit"t" string
                print_t final

                # Marshal your output arguments 
                move $v0, final    # $v0 = final

                # Return from the subroutine `jr $ra`
                jr $ra

                # With the test input, the value of v0 should be:
                # v0: 0x2B538400
