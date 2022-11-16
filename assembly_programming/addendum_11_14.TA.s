        .globl encode_binary32
        .include "macros/syscalls.s"

        .macro position_of_msb(%reg)
                move $a0, 0             #        counter = 0;
                move $a1, %reg          #        number = %reg;
          loop: beq $a1, $zero, done    # loop:  for(; number != zero ;) {
                  addi $a0, $a0, 1      #           counter ++;
                  srl $a1, $a1, 1       #           number = number >> 1;
                b loop                  #           break loop;
                                        #        }
          done: nop                     # done:  nop
                move $v0, $a0           #        $v0 = counter;
        .end_macro

encode_binary32: nop     # binary32 = encode_binary32(sign, number, expon_sign, expon)
        # Formal Arguments
        # - a0: sign -- an ASCII charactor
        # - a1: number (representing in total:  1.\<mantissa\>) 
        # - a2: expon_sign -- an ASCII character
        # - a3: exponent (unbiased)
        # - v0: the encoded binary32 value

        # Register Allocation
        # t0: sign
        # t1: number, mantissa
        # t2: expon_sign 
        # t3: exponent
        # t4: 
        # t5: 
        # t6: 


        # 1. demarshal your input arguments
        move $t0, $a0
        move $t1, $a1
        move $t2, $a2
        move $t3, $a3

        # 1. decode and then encode the sign
        if ( sign == "+") { sign = 0;}
        if ( sign == "-") { sign = 1;}

        # 1. reposition the number to drop the leading 1, and left justify the mantissa 
        #    - use the 'position_of_msb' macro to determine 
        #    - shift the number to the left, while also dropping the leading 1
        $v0 = position_of_msb(number)
        number = number << ( 32 - $v0 + 1 )


        # 1. decode the sign of the exponent and then re-encode the exponent
        if ( expon_sign == "+") { expon_sign = 0; expon = expon; }
        if ( expon_sign == "-") { expon_sign = 1; expon = ~ expon + 1; }

        # 1. add the bias to the exponent
        expon = expon + bias ; bias = 127;

        # 1. shift the pieces into place
        sign = sign << 31;
        expon = expon << 23;
        number = number >> ( 1 + 8 );


        # 1. merge the pieces together
        final = sign | expon;
        final = final | number;



        # 1. call print_t to print the value



        # 1. marshal your output arg
        move $v0, ??? 


        #  1. return 
        #    - \# this will cause an interrupt
        #    - ignore for now
        jr $ra