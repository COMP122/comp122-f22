  ```java
   product = 0;
   for ( i = 1 ; i <= b ; i ++ ) {
     product = product + a; 
   }
   result = product;
   ```

  1. Issues:
     * Problem 6: Need to break down the semantics of the for-loop
     * Problem 7: Need reduce the number of jumps
  ```java
              product = 0;
              i = 1;
      top:    for(; i<=b ;) {
         
               product = product + a; 
         
               i = i + 1;
               continue top;

              }
      done:   ; 
              result = product;
  ```

    ```mips
            # Register allocation
            # t0: a
            # t1: b
            # t2: i
            # t3: product
            # t4: result
   
            li $t3, 0                  #         product = 0;
            li $t2, 1                  #         i = 1;
     top:   bgt, $t2, $t1,  done       # top:    for(; i<=b ;) {
                                       #    
               add $t3, $t3, $t0       #          product = product + a; 
                                       #    
               addi $t2, $t2, 1        #          i = i + 1;
            b top                      #          continue top;
                                       # 
                                       #         }
    done:   nop                        # done:   ; 
            move $t4, $t3              #        result = product;
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
        ```java
                sum = 0;
                length = A.length;

                ref_A = A;

                i = 0;
        bob:    for (; i < length ;) {
                  value = ref_A[i];
                  sum = sum + value;
                  i = i + 1;
                  continue bob;
                }
        mary:   ; 
                result = sum;
        ```


      ```C
                sum = 0;
                length = 5;

                ref_A = &A;

                i = 0;
        bob:    for (; i < length ;) {
                  
                  value = (* ref_A);

                  sum = sum + value;

                  ref_A = ref_A + 1;
                  i = i + 1;
                  continue bob;
                }
        mary:   ; 
                result = sum;
      ```

     ```mips
             # Register allocation
             # t0: sum
             # t1: i
             # t2: length
             # t3: result
             # t7: value
             # t8: ref_A

             li $t0, 0             #         sum = 0;
             li $t2, 5             #         length = 5;
                                   # 
             la $t8, A             #         ref_A = &A;
                                   # 
             li $t1, 0             #         i = 0;
  
       bob:  bge $t1, $t2, mary    # bob:    for (; i < length ;) {
                                   #           
               lb $t7,  0($t8)     #           value = (* ref_A);
                                   # 
               add $t0, $t0, $t7   #           sum = sum + value;
                                   # 
               addi $t8, $t8, 1    #           ref_A = ref_A + 1;
               addi $t1, $t1, 1    #           i = i + 1;
             b bob                 #           continue bob;
                                   #         }
       mary: nop                   # mary:   ; 
             move $t3, $t0         #         result = sum;
      ```



