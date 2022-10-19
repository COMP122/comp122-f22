# COMP122 Lecture Notes: October 19 & 20, 2022

## Announcements
   1. In-class (42-kickstart) assignment is overdue.
      - Originally due at the end of W/R class (Oct 12/13)
      - More time was provided.

## Today's Agenda
   1. M/W A: Pickup at Multiplication
   1. Conversions between bases of "Powers of 2"
   1. Conversion from base 16, 8, 2 -> Decimal
      - Right -> Left method:  Expanded Notation
      - Left -> Right method:  loop: multiple; add;
   1. Conversion from Decimal -> base N
      - whole part: successive integer divisions
        * number / 2 -> whole , remainder
      - fractional part: successive multiplications
        * number * 2 -> overflow, product
   1. Review of Encodings:
      1. binary (unsigned integer)
      1. 1's complement (signed integer)
      1. 2's complement (signed integer)
      1. BCD (same as Hex, but without A-F)


## Questions
   1. M/W M:
   1. M/W A:
   1. T/R M: 
   1. T/R A: 

## Today's Material

   1. See Addendum Page

   1. Convert whole to binary
      ```
      number = 1234

         1234 / 2 -> 617, 0
         617 / 2 -> 308, 1
         308 / 2 -> 154, 0
         154 / 2 -> 77, 0
         77 / 2 -> 38, 1
         38 / 2 -> 19, 0
         19 / 2 -> 9, 1
         9 / 2 -> 4, 1
         4 / 2 -> 2, 0
         2 / 2 -> 1, 0
         1 / 2 -> 0, 1
         0 / 2 -> 0, 0

      answer = 2# 10011010010    (reading up!)
      ```

   1. Convert fraction to binary
      ```
      number:  0.0567
      max   =  1,0000

        567  * 2 =   1134 -> 0
        1134 * 2 =   2268 -> 0
        2268 * 2 =   4536 -> 0
        4536 * 2 =   9072 -> 0
        9072 * 2 = 1,8144 -> 1
        8144 * 2 = 1,6288 -> 1

      answer: 2# 000011 ... 101000001111100100001001
      ```

---
## Resources
   1. Rechunk Examples: https://docs.google.com/spreadsheets/d/1tBmsjIwX6u5yHchqwrEnGIQBAEeGehVoaiRYv_lCpOA/edit#gid=0
   1. Base Conversion: https://docs.google.com/spreadsheets/d/1aMvlfw_rzvYBObT94dX8v_O0EgELHgWrmZgWKmoLY7s/edit#gid=1434558784


