Counting 0000 TO 9999 using FPGA

Explaination on each module

1) bintobcd.v
   It is Binary to BCD(BInary Coded Decimal) conversion
   Double Dabble alogirithm is used.
   Iterated once for each bit in input number, if any BCD digit is >= 5, added three to it
   Then shifted one bit, and shift in proper bit from input end
   
2) counters_ucf.ucf
   
   In this file each pin which is assigned to input and outputs are mentioned
   
3) 
