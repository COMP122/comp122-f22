        .globl atoi

        .data

ascii_char: .byte '*'
digit:      .word 42

s:          .ascii "This is the first part of the string"
            .asciiz ", this is the second part."

a:       .half 0
         .half 1
         .half 2
         .half 3

A:      .space 256



        .text


.macro alloc(%size)
   subi $sp, $sp, %size 
   move $v0, $sp

.end_macro


.macro min(%a, %b)
  bge %a, %b, else          # if ( a < b) {
    mv $v0, %a              
    b done                  #    return a;
else:                       # } else
    mv $v0, %b
    b done                  #   return b;
done: nop                   # }

.end_macro

################################################################
main:   # Java: public static void main(String argv[]);
        # C: int main(int argc, char * argv[]);

        # Formal Arguments
        # v0: number
        # a0: argc 
        # a1: argv


        # Register Allocation
        # s0: number
        # t0: argc
        # t1: argv
        # t2: str, argv[0]


        lw $t2, 0($t1)        # str = argv[0]

        # number = atoi(str);
        #1. precall
        push_args($t2)        # push str
        push_t_registers
        push $fp, $sp, $ra

        #1. call
        jal atoi
        #1. postcall
        pop $fp, $sp, $ra
        pop_t_registers
        pop_results($s0)      # pop number

        print_d $s0
        move $v0, $s0

        exit $v0
################################################################



################################################################
atoi: # int atoi(const char *str)
         # Formal Arguments
         # v0: number
         # a0: &str


         # Register Allocation
         # s0: number
         # t0: &str
         # t1: value
         # t2: base
         # t3: digit
         # t4: index
         # t5: ascii_char
         # t6: &str + index

         #1. setup
         push_s_registers
         # Demarshall Input Args
         move $t0, $a0       #  str = formal str

         #1. compute


         li $t4, 0              # index = 0;
         add $t6, $t0, $t4
         lb $t5, 0($t6)         # ascii_char = str[index];
         li $t1, 0              # value = 0;
         li $t2, 10             # base = 10;

    l:   beq $t5, '\0', d       # l: for( ; ascii_char != `\0`;) {

           subi $t3, $t5, '0'   #      digit = ascii_char - '0';
           mul $t1, $t1, $t2    #      value = value * base + digit;
           add $t1, $t1, $t3
           add $t6, $t0, $t4
           lb $t5, 0($t6)       #      ascii_char = str[index];
         b l                    #      continue l;
                                #    }
    d:   nop                    # d: ; 
         move $s0, $t1          # number = value; 



         #1. cleanup
         move $v0, $s0          # number
         pop_s_registers
         # Marshall Returns Values


        jr $ra
################################################################





