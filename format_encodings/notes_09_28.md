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
      - 
   1. T/R M: 
      -
   1. T/R A: 


---
# Today's Material

   1. 2# 101010010100010111110001110001101010101010111
   1. 8# 522427616152527
      - 2# 101 010 010 100 010 111 110 001 110 001 101 010 101 010 111
      - 0522427616152527
   1. 034265432345432
      - 000 011 100 010 ...
   1. 0x6476A543FFE
      - 0110 0100 0111 0110 1010 0101 0100 0011 1111 1111 1110
   1. 16# 1528BE38D557
      - 2# 1 0101 0010 1000 1011 1110 0011 1000 1101 0101 0101 0111
      - 2# 0001 0101 0010 1000 1011 1110 0011 1000 1101 0101 0101 0111
      - 16# 1528BE38D557

   1.  03456432345  -> 0x?   : answer = 0x01CBA35A5
      - 2# 000 011 100 101 110 100 011 010 110 100 101
      - 2# 000011100101110100011010110100101
      - 2# xxx0 0001 1100 1011 1010 0011 0101 1010 0101
      - 16# 01CBA35A5
   1. 2# 00101011011100011011111110010101  -> BCD
      - 2# 0010 1011 0111 0001 1011 1111 1001 0101
      - BCD: 2 NA 7 1 NA NA 9 5


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

   1. UTF string to U+ ??? :
      - 2# 111011111000110110000011 (problem 1)
        - 1110 xxxx | 10 xxxxxx  | 10 xxxxxx
        - 1110 1111 | 10 001101  | 10 000011
        - 2# 1111001101000011

      - 2# 111011111100110110000011 (problem 2) invalid!
        - 1110 xxxx | 10 xxxxxx  | 10 xxxxxx
        - 1110 1111 | 11 001101  | 10 000011
---
## Resources
   * (Intro into Numbering Systems)[https://docs.google.com/presentation/d/1TstBVluEDyFLD4pkXwVV-dDbA86tGUea1gV1vLL1mXE/edit#slide=id.gf1bcb9d487_0_2357]
   * class-material/format_encodings/encode_utf8.md
   * class-material/format_encodings/decode_utf8.md
  1. Slides

## Notes
   * T/R: Need to finish coverage on UTF-8
