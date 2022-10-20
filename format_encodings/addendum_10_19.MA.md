# COMP122 Addendum for Monday Afternoon: October 19


1. Convert 16# 34AB23 -> Decimal


   |  v      | = |  v     | * base + |  digit |  glyph  |
   |---------|---|--------|----------|--------|---------|
   |       3 | = |      0 | * 16 +   |    3   |    3    |
   |      52 | = |      3 | * 16 +   |    4   |    4    |
   |     842 | = |     52 | * 16 +   |   10   |    A    |
   |   13483 | = |    842 | * 16 +   |   11   |    B    |
   |  215730 | = |  13483 | * 16 +   |    2   |    2    |
   | 3451683 | = | 215730 | * 16 +   |    3   |    3    |


1. Convert 8# 3502  --> Decimal

  | v    | = | v    | * 8 +   |  digit |  glyph  |
  |------|---|------|---------|--------|---------|
  |   3  | = |    0 | * 8 +   |    3   |    3    |
  |  29  | = |    3 | * 8 +   |    5   |    5    |
  | 232  | = |   29 | * 8 +   |    0   |    0    |
  | 1858 | = |  232 | * 8 +   |    2   |    2    |



1. Convert 10# 3462  --> Decimal

  | v    | = | v   | * 10 + |  digit |  glyph  |
  |------|---|-----|--------|--------|---------|
 

1. Convert 2# 1010 1101  --> Decimal

   | v    | = | v    | * base + |  digit |  glyph  |
   |------|---|------|----------|--------|---------|
   |   1  | = |   0  | * 2 +    |    1   |    1    |   
   |   2  | = |   1  | * 2 +    |    0   |    0    |   
   |   5  | = |   2  | * 2 +    |    1   |    1    |   
   |  10  | = |   5  | * 2 +    |    0   |    0    |   
   |  21  | = |  10  | * 2 +    |    1   |    1    |   
   |  43  | = |  21  | * 2 +    |    1   |    1    |   
   |  86  | = |  43  | * 2 +    |    0   |    0    |   
   | 173  | = |  86  | * 2 +    |    1   |    1    |   
  



1. Convert 10# 251.173 -> 2# 1111 1011 . 00101
   1. Convert 10# 251 -> 2# 1111 1011
   
      ```
      number = 251
   
           251 / 2 -> 125, 1  <!-- response >
           125 / 2 -> 62, 1   <!-- response >
            62 / 2 -> 31, 0   <!-- response >
            31 / 2 -> 15, 1   <!-- response >
            15 / 2 -> 7, 1    <!-- response >
             7 / 2 -> 3, 1    <!-- response >
             3 / 2 -> 1, 1    <!-- response >
             1 / 2 -> 0, 1    <!-- response >
   
      answer: 1111 1011 (from bottom to top)
      ```

   1. Convert 10# .173 -> 2#
      ```
      number:   173
      max:    1,000

      173 * 2 -> 0,346 -> 0
      346 * 2 -> 0,692 -> 0
      692 * 2 -> 1,384 -> 1
      384 * 2 -> 0,768 -> 0
      768 * 2 -> 1,536 -> 1
      536 * 2 -> 


      answer = 00101 ....  (top to bottom)
      ```



1. Convert 10# 32.125 -> 2# 10 0000 . 001
   1. Convert 10# 32 -> 2# 10 0000
   ```
   number = 32

   32 / 2 -> 16, 0
   16 / 2 ->  8, 0
    8 / 2 ->  4, 0
    4 / 2 ->  2, 0
    2 / 2 ->  1, 0
    1 / 2 ->  0, 1

   answer = 10 0000  (from the bottom to the top)
   ```

   1. Convert 10# .125 -> 2# 001
   ```
   number:   125
   max:    1,000

   125 * 2 -> 0,250 -> 0
   250 * 2 -> 0,500 -> 0
   500 * 2 -> 1,000 -> 1
   000 * 2 -> 0,000 -> 0  -- converged


   answer: 001 (from the top down)
   ```


 1. Formats:
    1. Convert 10# 7 -> formats of size 8 bits
       - binary value:   111 --> 0000 0111
       - unsigned (xxxx xxxx): 0000 0111
       - 1's (s xxx xxxx):  0 000 0111      111 -> 000 0111
       - 2's (s xxx xxxx):  0 000 0111   


    1. Convert 10# -7 -> formats of size 8 bits
       - binary value:   - 111
       - unsigned (xxxx xxxx): NA
       - 1's (s xxx xxxx): 1111 1000
           - 000 0111  pad to 7
           - 111 1000  flip the bits
       - 2's (s xxx xxxx): 1111 1001
           - 000 0111 pad to 7    
           - 111 1001 (flip + 1)  

1. Convert 10# -7  -> formats of size 16 bits
       - binary value:   - 111
       - unsigned (xxxx xxxx): NA
       - 1's (s xxx xxxx): 1 111 1111 1111 1000 
           - pad 15: 000 0000 0000 0111
           - flip:   111 1111 1111 1000      
       - 2's (s xxx xxxx): 1111 1111 1111 1001     
          - pad 15: 000 0000 0000 0111
          - flip:   111 1111 1111 1000      
          - add 1:  111 1111 1111 1001      



1. convert 10# -11 -> formats of size 16 bits
      - binary: - 1011
      - unsigned (xxxx xxxx): NA
      - 1's (s xxx xxxx):  1 111 1111 1111 0100
        - pad to 15: xxx xxxx xxxx xxxx, 000 0000 0000 1011
        - flip: 111 1111 1111 0100
      - 2's (s xxx xxxx): 1 111 1111 1111 0101
        - pad to 15: 000 0000 0000 1011
        - flip:      111 1111 1111 0100
        - add 1:     111 1111 1111 0101













