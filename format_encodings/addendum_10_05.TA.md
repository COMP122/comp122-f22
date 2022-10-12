  1.
    * Create a subroutine:
      1. prototype:  int multiplication(int a, int b);

      ```mips

      multiplication:   nop         # int multiplication(int a, int b);
               # Arguments
               # v0: result = a * b;
               # v1: 
               # a0: a
               # a1: b
               # a2: 
               # a3: 

               # Register allocation
               # t0: a
               # t1: b
               # t2: product
               # t3: i
               # t4: result

               # Demarshal my inputs
               move $t0, $a0
               move $t1, $a1

               li $t2, 0                           #        product = 0;
               li $t3, 1                           #        i = 1;
       bob:    bgt, $t3, $t1, mary                 # bob:   for (; i <= b ;) {
               add $t2, $t2, $t0                   #          product = product + a; 
                                                   #   
               addi $t3, $t3, 1                    #          i = i + 1;
               b bob                               #          continue bob;
                                                   #        }
       mary:   nop                                 # mary:  ;
               move $t4, $t2                       #        result = product;
                                                   #        return result;
               move $v0, $t4
               jr $ra
      ```
      * call:  x= multiplication(10, 3)

      ```mips

         # Register allocation
         # t0: 10
         # t1: 3
         # t9: x

         li $t0, 10
         li $t1, 3

         # Marshall my inputs
         move $a0, $t0            # arg_1 = 10
         move $a1, $t1            # arg_2 = 3


         jal multiplication       # call multiplication

         # demarshal the return
         move $t9   $v0           # x = return_1

      ```
   

   1. Accessing an Array
      * Consider the following Java version
        ```java
        sum = 0;
        for ( i = 0 ; i < A.length ; i ++ ) {
          sum += A[i];
        }
        result = sum;
        ```


      * A Simplified Java Version
        ```C
                sum = 0;
                length = 5; 

                ref_A = & A;

                i = 0;
        jack:   for (; i < length ;) {
                  value = ( * ref_A);
                  sum = sum + value;

                  ref_A = ref_A + 1;
                  i = i + 1;
                  continue jack;
                }
        jill:   ;
                result = sum;

        ```


       ```mips
               # Register allocation
               # t0: sum 
               # t1: length
               # t2: i
               # t3: value
               # t4: ref_A

                                          #         sum = 0;
                                          #         length = 5; 
                                          #
               la $t4, A                  #         ref_A = & A;
                                          #
                                          #         i = 0;
        jack:                             # jack:   for (; i < length ;) {
               lb $t3, 0($t4)             #           value = ( * ref_A);
                                          #           sum = sum + value;
                                          #
                                          #           ref_A = ref_A + 1;
                                          #           i = i + 1;
                                          #           continue jack;
                                          #         }
        jill:                             # jill:   ;
                                          #         result = sum;
                                          #
        ```