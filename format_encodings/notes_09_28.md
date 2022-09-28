# COMP122 Lecture Notes: September 26 & 27, 2022

## Announcements
   1. Question: are you using the Slack "fat" client?
   1. Assignments Released
      - 21-table-encodings: Due Friday
      - 22-utf-encoding: Due Monday
   1. Review of Questions from last time:
      - make, diff, ping, traceroute
      - background processes

## Today's Agenda
   1. Review outstanding questions
   1. Practicum
      - Table Encodings
      - UTF-8 Encodings
   1. Intro into Numbering Systems


## Questions
   1. M/W M: 
      - Nothing!
   1. M/W A:
      - Nothing!
   1. T/R M: 
      -
   1. T/R A: 


---
# Today's Material

   1. 2# 101010010100010111110001110001101010101010111
      - => 8# 522427616152527
        - 2# 101 010 010 100 010 111 110 001 110 001 101 010 101 010 111
        - 0522427616152527
   1. 034265432345432
      - => 2# 000 011 100 010 ...
   1. 0x6476A543FFE
      - => 2# 0110 0100 0111 0110 1010 0101 0100 0011 1111 1111 1110
   1. 16# 1528BE38D557
      - => 2# 1 0101 0010 1000 1011 1110 0011 1000 1101 0101 0101 0111
      - => 2# 0001 0101 0010 1000 1011 1110 0011 1000 1101 0101 0101 0111
      - => 16# 1528BE38D557

   1.  03456432345  -> 0x?   : answer = 0x01CBA35A5
      - 2# 000 011 100 101 110 100 011 010 110 100 101
      - 2# 000011100101110100011010110100101
      - 2# xxx0 0001 1100 1011 1010 0011 0101 1010 0101
      - 16# 01CBA35A5
   1. 2# 00101011011100011011111110010101  -> BCD
      - 2# 0010 1011 0111 0001 1011 1111 1001 0101
      - BCD: 2 NA 7 1 NA NA 9 5

# 2#, 8#, 16#, BCD, ASCII, MIPs

   1. 2# 0010101111100010101011011000011100011101010101
      - => 16
      - 2# 0000 1010 1111 1000 1010 1011 0110 0001 1100 0111 0101 0101
      - 16# 0AF8AB61C755 
      - => 8#
      - 2# 000 010 101 111 100 010 101 011 011 000 011 100 011 101 010 101
      - 8# 0257425533034352

   1. 16# 12F54EAB643
      - => 8# 022752472533103
      - 16# 12F54EAB643
      - 2# 0001 0010 1111  0101 0100 1110 1010 1011 0110 0100 0011
      - 2# 000 010 010 111 101 010 100 111 010 101 011 011 001 000 011


1. UTF8
   1. U+F342
      - 0xF342
      - 1111 0011 0100 0011
      - 0000 0000 0000 0000 0000 1111 0011 0100 0011
      - number of bytes.. 3
        - 1110 xxxx -> 1110 1111
        - 10 xxxxxx -> 10 0011 01
        - 10 xxxxxx -> 10 00 0011
        - 0000 0000 0000 0000 0000 | 1111 | 0011 01 | 00 0011
      - 1110 1111 10 0011 01 10 00 0011

   1. UTF-8 string to U+ ??? :
      - 2# 111011111000110110000011 (problem 1)
        - 1110 xxxx | 10 xxxxxx  | 10 xxxxxx
        - 1110 1111 | 10 001101  | 10 000011
        - 2# 1111001101000011

      - 2# 111011111100110110000011 (problem 2) invalid!
        - 1110 xxxx | 10 xxxxxx  | 10 xxxxxx
        - 1110 1111 | 11 001101  | 10 000011

   1. UTF-8 string to U+ 4F3A3
      - 0X 4F3A3
      - 2#       01 |    00 1111 |    0011 10 |    10 0011
      -   11110 xxx | 10 xx xxxx | 10 xxxx xx | 10 xx xxxx
      -   11110 001 | 10 00 1111 | 10 0011 10 | 10 10 0011
      - 2# 1111 0001  1000 1111 1000 1110 1010 0011
      - 16# F18F8EA3

   1. UTF-8 (hex) - U+
      - 16# EF 8E A3 
      - 2# 1110 1111   | 10 001110 | 10 001110 |
      -  | 1110 xxxx   | 10 xxxxxx | 10 xxxxxx | 
      - 1111 0011 1000 1110
      - 16# F38E
---
## Resources
   * (Intro into Numbering Systems)[https://docs.google.com/presentation/d/1TstBVluEDyFLD4pkXwVV-dDbA86tGUea1gV1vLL1mXE/edit#slide=id.gf1bcb9d487_0_2357]
   * class-material/format_encodings/encode_utf8.md
   * class-material/format_encodings/decode_utf8.md
  1. Slides

## Notes
   * T/R: Need to finish coverage on UTF-8
