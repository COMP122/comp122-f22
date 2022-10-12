       ```java
                  sum = 0;

                  length = A.length;
                  ref_A = A;

                  i = 0;
           bob:   for (; i < length ;) {
                    sum = sum + ref_A[i];
         
                    i = i + 1;
                    continue bob;
                  }
           mary:  ;
                  result = sum;
        ```

       ```C
                  sum = 0;

                  length = A.length;
                  ref_A = &A;

                  i = 0;
           bob:   for (; i < length ;) {
                    value = (* ref_A);
                    sum = sum + value;
         
                    ref_A = ref_A + 1;
                    i = i + 1;
                    continue bob;
                  }
           mary:  ;
                  result = sum;
        ```


      ```mips
         # Register allocation
         # t0: sum
         # t1: length
         # t2: ref_A
         # t3: i
         # t4: result
         # t5: value
         # t6: 
                              #           sum = 0;
                              #
                              #           length = 5;
              la  $t2, A      #           ref_A = &A;
                              #
                              #           i = 0;
      bob:                    #    bob:   for (; i < length ;) {
                              #             value = (* ref_A);
              lb $t5, 0($t2)  #             sum = sum + value;
                              #  
                              #             ref_A = ref_A + 1;
                              #             i = i + 1;
                              #             continue bob;
                              #           }
      mary:                   #    mary:  ;
                              #           result = sum;
      ```
