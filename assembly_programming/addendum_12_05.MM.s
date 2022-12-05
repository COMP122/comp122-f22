       .globl atoi

       .macro asciiDigit2num(%r0, %r1)
         addui %r0, %r1, - '0'
       .end_macro


atoi:  # atoi(const char * str)
       # v0: the number
       # a0: the string to convert

       # Register Allocation
       # t0: digits[]
       # t1: the number

       # t2: digit_ascii, string[i]
       # t3: digit
       # t4: base
       # t5: value
       # t6: i
       # t7: digits+i, address

       # Setup
       push_s_registers

       # Demarshal my inputs
       move $t0, $a0




       li $t5, 0                     //       value = 0;
       li $t6, 0                     //       i = 0;
       li $t2, '1'                   //       digit_ascii = '1';
       li $t4, 10                    //       base = 10

 loop: beq $t2, '\0', done           // loop: for(;  digit_ascii != '\0' ;) {
         add $t7, $t0, $t6           //         // address =digits+i
         lb $t2, 0($t7)              //         digit_ascii = digits[i];
                                     //         // digit = digit_ascii - '0';

         subi $t3, $t2, '0'          //     asciiDigit2num digit, digit_ascii


                                     //         value = value * base + digit 
         mul $t5, $t5, $t4           //            v = v * base
         add $t5, $t5, $t3           //            v = v + digit
         addi $t6, $t6, 1            //         i ++;
       b loop                        //         continue;
                                     //       }
 done: nop                           // done: ;
                                     //       value = value;



       # Marshal my return
       mov $v0, $t5

       # Cleanup
       pop_s_registers

       jr $ra

       
#############################

main:  # C:     int main(int argc, char* argv[]) 
       # Java:  void static int main(String args[])
       # Formal Arguments
       # v0: the number
       # v1: 
       # a0: arguement count (argc)
       # a1: argv array
       # a2: 
       # a3: 

       # Register Allocation
       # t0: argc
       # t1: argv
       # t2: argv[0]  -- the string to convert
       # t3: the number

       # Demarsal inputs
       move $t0, $a0
       move $t1, $a1
       lw $t2, 0($t1)

       # number = atoi(argv[0])
       ####################################################
       # precall
       push_args $t2
       push_t_registers
       push $ra, $sp, $fp

       # call
       jal atoi

       # postcall
       pop $ra, $sp, $fp
       pop_t_registers
       pop_results $t3
       ####################################################

       # Marshal return
       move $v0, $t3
       exiti 0
