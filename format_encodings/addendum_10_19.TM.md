# COMP122 Addendum for Tuesday Morning : October 20, 2022



1. Convert 16# 7A83 => 10# 31363


   | v      | = | v    | * base + |  digit |  glyph  |
   |--------|---|----- |----------|--------|---------|
   | 7      | = | 0    | *   16 + |    7   |  7      |
   | 122    | = | 7    | *   16 + |   10   |  A      |
   | 1960   | = | 122  | *   16 + |    8   |  8      |
   | 31363  | = | 1960 | *   16 + |    3   |  3      |



1. Convert 10# 53.47 -> 2# 0011 0101 . 0111 10
   1. Convert 10# 53 -> 2# 
   
      ```
      number = 53
   
          53  / 2 ->  26, 1 
          26  / 2 ->  13, 0
          13  / 2 ->   6, 1 
           6  / 2 ->   3, 0
           3 / 2  ->   1, 1
           1 / 2  ->   0, 1
           0 / 2  ->   0, 0
           0 / 2  ->   0, 0

      anwser: 0011 0101  (read from the bottom up)
      ```
   1. Convert 10# .47 -> 2# 

      ```
      number =   47
      max    = 1,00

         47 * 2 = 0,94 -> 0
         94 * 2 = 1,88 -> 1
         88 * 2 = 1,76 -> 1
         76 * 2 = 1,52 -> 1
         52 * 2 = 1,04 -> 1
         04 * 2 = 0,08 -> 0

      answer =  011110 (read from the top down)
      ```


1. Convert 10# -64.125 -> 2# - 100 0000 . 0010
   1. Convert #10 64 -> 2# 100 0000
   ```
   number = 64

      64 / 2 -> 32, 0
      32 / 2 -> 16, 0
      16 / 2 ->  8, 0
       8 / 2 ->  4, 0
       4 / 2 ->  2, 0
       2 / 2 ->  1, 0
       1 / 2 ->  0, 1

   answer = 100 0000
   ```
   1. Convert #10 .125 -> 2# 001
   ```
   number =   125
   max    = 1,000

     125 * 2 -> 0,250 -> 0
     250 * 2 -> 0,500 -> 0
     500 * 2 -> 1,000 -> 1
     000 * 2 -> 0,000 -> 0  (converged)
     000 * 2 -> 0,000 -> 0
     000 * 2 -> 0,000 -> 0
     000 * 2 -> 0,000 -> 0

   answer = 001 (from the top down)
   ```






1. Encoding for 8 bits:  2#   101 0101
      - unsigned xxxx xxxx: 0101 0101
      - 1's s xxx xxxx:  0 101 0101
        - pad:  
        - flip: -- not negative
      - 2's s xxx xxxx: 0 101 0101
        - pad: 
        - flip: -- not negative
        - add 1: -- not negative

1. Encoding for 8 bits:  2#  - 101 0101
      - unsigned xxxx xxxx: NA
      - 1's s xxx xxxx:  1 010 1010
        - pad:   101 0101
        - flip:  010 1010
      - 2's s xxx xxxx: 1 010 1011
        - pad:   101 0101
        - flip:  010 1010
        - add 1: 010 1011
















