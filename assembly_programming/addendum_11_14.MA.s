
        .globl encode_binary32

encode_binary32:  nop 
          # a0: sign (0: positive, 1: negative), e.g. 0
          # a1: whole (always 1)
          # a2: fractional part, e.g., 5354
          # a3: exponent (unbiased),  -41
          # v0: the encoded binary32 value
          # ----
          # t0: sign
          # t1: whole
          # t2: fractional part
          # t3: expon
          # t4: result

          # 1. shift the pieces into place
          # 1. merge the pieces together
          # 1. call print_t to print the value
          # 1. marshal your output arg
          # 1. return 

          # 1. demarshal your input args
          move $t0, $a0        #sign = sign;
          #whole = whole;
          #fractional = fractional;
          #expon = expon;

          # 1. ~encode the sign~ (done)
          # 1. ~drop the leading 1~ (done)


          # 1. add the bias to the exponent
          addi $t3, $t3, 127  #expon = expon + 127;

          sll $t0, $t0, 31    #sign = sign << 31;
          #$v0 = msb_num(mantissa); # side effect of modifing $v0
#
          #mantissa = mantissa << (32 - msb_number);
          #expon = expon << 23
#
          #result = sign | expon ;
          #result = result | mantissa;

          print_t ( result )
          # return result







