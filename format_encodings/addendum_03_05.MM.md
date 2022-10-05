   ```java
          product = 0;
          i = 1;
   top:   for (; i <= b ;) {
             product = product + a;

             i = i + 1;
             continue top;
          }
   done:  ;       
          result = product;
   ```
   ```TAC
          product = 0;
          i = 1;
   top:   for (; i <= b ;) {
             product = product + a;

             i = i + 1;
             continue top;
          }
   done:  ;       
          result = product;
   ```

   ```mips
             # Register allocation
             # t0: a
             # t1: b
             # t2: product
             # t3: i 
             # t4: result
    
             li $t2, 0               #          product = 0;
             li $t3, 1               #          i = 1;
      top:   bgt $t3, $t1, done      #   top:   for (; i <= b ;) {
               add $t2, $t2, $t0     #             product = product + a;
                                     #
               addi $t3, $t3, 1      #             i = i + 1;
             b top                   #             continue top;
                                     #          }
      done:  nop                     #   done:  ;       
             move $t4, $t2           #          result = product;         


   ```

   ```
