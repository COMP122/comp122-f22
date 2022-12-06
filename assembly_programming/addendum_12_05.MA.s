                .globl atoi

.macro push_results(%reg)
   move $v0, %reg
.end_macro

########################################################################
main:   # java:  public static void main(String args[]);
        # C:     int main(int argc, char argv[]);

        # Formal Arguments
        # v0: number
        # a0: argc
        # a1: argv


        # Register Allocation
        # s0: number
        # t0: argc
        # t1: argv
        # t2: argv[0]


        # Demarshal Inputs
        move $t0, $a0
        move $t1, $a1
        lw $t2, 0($t1)


        # X = atoi(argv[0]);
        #--------------
        # 1. Precall
        push_args $t2
        push_t_register
        push $ra, $fp, $sp

        # 2. Call
        jal atoi

        # 3. Postcall
        pop $ra, $fp, $sp
        pop_t_register
        pop_results $s0

        # Marshal my output
        move $v0, $s0

        exiti 0
########################################################################




########################################################################
atoi:   # java: Integer.parseInt(String str);
        # C:    int atoi(char * str);

        # Formal Arguments
        # v0: number
        # a0: str

        # Register Allocation
        # s0: number
        # t0: str, digits
        # t1: value
        # t2: base: 10
        # t3: digit
        # t4: ascii_digit
        # t5: index
        #

        # 1. setup
        push_s_registers

        # 2. compute
        # Demarshal args
        move $t0, $a0

        # load locals
        li $t2, 10

                                # value = 0;
                                # index = 0;
                                # ascii_digit = digits[index];
        
                                # loop: while (ascii_digit != '\0') {
                                # 
                                #          digit = ascii_digit - '0';
        
                                #          value = value * base;
                                #          value = value + digit;
                                #        
                                #          # next
        addi $t5, $t5, 1        #          index ++;
                                #          ascii_digit = digits[index];
                                #          continue;
 
                                #       }
                                # done: ;
                                #       value = value; 


        # 3. cleanup
        pop_s_registers


        push_return $s0
        jr $ra
########################################################################







