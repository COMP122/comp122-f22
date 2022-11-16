                .globl encode_binary32

.macro position_of_msb(%reg)
                move $a0, 0             #        counter = 0;
                move $a1, %reg          #        number = %reg;
        loop:   beq $a1, $zero, done    # loop:  for(; number != zero ;) {
                  addi $a0, $a0, 1      #           counter ++
                  srl $a1, $a1, 1       #           number = number >> 1;
                b loop                  #           break loop;
                                        #        }
        done:   nop                     # done:  nop
                move $v0, $a0           #        $v0 = counter;
.end_macro
 

# STATUS of the notes below..
#   1. TAC has been sketched out
#   2. Need to review, and double check math
#   3. Need to transform TAC into MIPS

encode_binary32: nop 
          # a0: sign (an ASCII charactor)
          # a1: unsigned number (in fixpoint:  1.\<mantissa\>) 
          # a2: sign of the exponent (an ASCII character)
          # a3: unsigned exponent (unbiased),  41
          # v0: the encoded binary32 value


          # Register Allocation
          # t0: sign
          # t1: unsigned number (in fixpoint), mantissa
          # t2: sign of expon
          # t3: exponent
          # t4: 
          # t5: 
          # t6: 


          # 1. demarshal your input args


          # 1. decode and then encode the sign
          if (sign == '+') { sign = 0;} 
          if (sign == '-') { sign = 1;}


          # 1. left justify the number (putting the fix point in the right place)
          #    - use the 'pos_msb' macro to determine 
          #    - shift the number to the left, while also dropping the leading 1
          $v0 = position_of_msb(number);
              amount = 32 ...  $v0
              number = number << amount

          # 1. decode the sign of the exponent and then reencode the exponent
          if (exp_sign == '+') { 
                exp_sign = 0; 
                expon = expon;
          }
          if (exp_sign == '-') { 
                exp_sign = 1;
                expon =  ~ expon + 1;
          }

          # 1. add the bias to the exponent
          expon = expon + bias;  // bias == 127

          # 1. shift the pieces into place
          sign     = sign << (32 - 1);
          expon    = expon << 32 - (1 + 8)  // this number should be 23
          mantissa = mantissa >> (1 + 8)


          # 1. merge the pieces together

          final = sign | expon 
          final = final| mantissa

          # 1. call print_t to print the value
          # 1. marshal your output arg
          # 1. return 
          #    - \# this will cause an interrupt
          #    - ignore for now

