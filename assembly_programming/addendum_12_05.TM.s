        .globl atoi

        .data
S1:     .ascii "This is the first part of the string"
        .asciiz ", and this is the second part."

S2:     .byte 'T', 'h', 'i', 's', '\0'

        .align 2
Stars:  .byte 42, 42, 42, 42, 42

index:  .word 23456
short_int: .half  512
char:    .byte   42

array:   .space 20


.macro pop_result(%reg)
        move %reg,  $v0
.end_macro

        .text
####################################################
main:   # Java: static public void main(String args[]);
        # C: int main(int argc, char * argv[]);
        # Formal Arguments
        # v0: number
        # a0: argc
        # a1: argv[]

        # Register Allocation
        # t0: argc
        # t1: argv[]
        # t2: str, argv[0]
        # t3: number


        lw $t2, 0($t1)                                  # str = argv[0];


        # number = atoi(str);
        # 1. precall
        
        # - pass args
        push_args($t2)

        # - save t register
        push_t_registers

        # - save return, and frame info
        push $ra, $sp, $fp

        # 2. call
        jal atoi

        # 3. postcall
        # - restore return and frame info
        pop $ra, $sp, $fp
        # - restore t register
        pop_t_registers
        
        # - receive return value
        pop_results($t3)        #  move $?,  $v0


        exiti 0

####################################################







####################################################
atoi:   # C: int atoi(char * str);

        # Formal Arguments
        # v0: number
        # a0: str

        # Register Allocation
        # s0: number
        # t0: str
        # t1: value
        # t2: base
        # t3: digit
        # t4: index
        # t5: ascii_digit
        # t6: &str + index


        # 1. Setup
        #  - demarshal args
        move $?, $a0

        #  - save some state
        push_s_registers

        # 2. Compute

                                #         index = 0;
                                #         value = 0;
        li $t2, 10              #         base = 10;
                                # 
                                # 
        add $t6, $t0, $t4
        lb $t5, 0($t6)          #         ascii_digit = str[index];
top:    beq $t5, $zero, done     # top:    while ( ascii_digit !=  '\0') {
                                # 
                                #           digit = ascii_digit - '0';
                                # 
          mul $t1, $t1, $t2     #           value = value * base;
                                #           value = value + digit;
                                # 
                                #           index ++;
                                #           ascii_digit = str[index];
                                #           continue top;
                                #         }
                                # done:   ;
                                # 




        # 3. Cleanup
        #  - marshal our return
        move $v0, $?

        #  - restore some state
        pop_s_registers



        jr $ra
####################################################




















