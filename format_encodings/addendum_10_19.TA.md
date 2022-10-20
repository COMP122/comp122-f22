# COMP122 Addendum for Tuesday Afternoon : October 20, 2022


1. Convert 2# 1010 0100  ->  10# 164

   | v      | = | v    | * base + |  digit |  glyph  |
   |--------|---|----- |----------|--------|---------|
   |   1    | = |  0   | *    2 + |    1   |    1    |
   |   2    | = |  1   | *    2 + |    0   |    0    |
   |   5    | = |  2   | *    2 + |    1   |    1    |
   |  10    | = |  5   | *    2 + |    0   |    0    |
   |  20    | = | 10   | *    2 + |    0   |    0    |
   |  41    | = | 20   | *    2 + |    1   |    1    |
   |  82    | = | 41   | *    2 + |    0   |    0    |
   | 164    | = | 82   | *    2 + |    0   |    0    |

1. Convert 16# 2A3 -> 10#675

   |  v     | = | v    | * base + |  digit |  glyph  |
   |--------|---|----- |----------|--------|---------|
   |    2   | = |  0   | *   16 + |    2   |    2    |
   |   42   | = |  2   | *   16 + |   10   |    A    |
   |  675   | = |  42  | *   16 + |    3   |    3    |


1. Convert 5# 23421 -> 10# 1736

   |  v     | = | v    | * base + |  digit |  glyph  |
   |--------|---|----- |----------|--------|---------|
   |    2   | = |  0   | *  5   + |    2   |    2    |
   |   13   | = |  2   | *  5   + |    3   |    3    |
   |   69   | = |  13  | *  5   + |    4   |    4    |
   |  347   | = |  69  | *  5   + |    2   |    2    |
   | 1736   | = | 347  | *  5   + |    1   |    1    |


1. Convert 10# - 23.75  -> 2# - 1 0111 . 11
   1. Convert 10# 23 -> 2# 1 0111
      ```
      number = 23

         23 / 2 -> 11, 1
         11 / 2 ->  5, 1
          5 / 2 ->  2, 1
          2 / 2 ->  1, 0
          1 / 2 ->  0, 1
          0 / 2 ->  0, 0  (converged)
          0 / 2 ->  0, 0 

      answer =  1 0111  (read from the bottom up)
      ```


   1. Convert 10# .75  -> 2#  .1100
      ```
      number =   75
      max    = 1,00

         75 * 2 ->  1,50  ->  1
         50 * 2 ->  1,00  ->  1
         00 * 2 ->  0,00  ->  0  (converged)
         00 * 2 ->  0,00  ->  0

      answer = 1100 (read from the top down)
      ```


1. Encoding for 8 bits:  2#   011 1011 0110
      * can't be done... Too big!
      - unsigned xxxx xxxx: 
      - 1's s xxx xxxx:  
        - pad:   
        - flip:  
      - 2's s xxx xxxx: 
        - pad:   
        - flip:  
        - add 1: 


1. Encoding for 8 bits:  2#  1011 0110
      - unsigned xxxx xxxx: 1011 0110
      - 1's s xxx xxxx:  Too big!
        - pad:   
        - flip:  
      - 2's s xxx xxxx:  Too big!
        - pad:   
        - flip:  
        - add 1: 



1. Encoding for 8 bits:  2#  + 0110
      - unsigned:  xxxx xxxx: 0000 0110
        - pad:  0000 0110
      - 1's:    s xxx xxxx:  0 000 0110
        - pad:   000 0110
        - flip:  not negative 
      - 2's:    s xxx xxxx:  0 000 0110
        - pad:  000 0110
        - flip:  not negative
        - add 1: 


1. Encoding for 8 bits:  2#  - 0110
      - unsigned:  xxxx xxxx: Nope -- negative number
        - pad:  
      - 1's:    s xxx xxxx:  1 111 1001 
        - pad:   000 0110
        - flip:  111 1001 
      - 2's:    s xxx xxxx: 1 111 1010
        - pad:  000 0110
        - flip: 111 1001 
        - add 1: 111 1010






























