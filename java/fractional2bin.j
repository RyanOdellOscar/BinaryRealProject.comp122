public static int fractional2bin(int fractional, int max_bits) {
   int max;
   int number;
   int bits;

   max = value_of_max(fractional);
   number = fractional;
   bits = 0;

   while (number != 0 && bits < max_bits) {
      bits++;
      number = number * 2; 
      if ( number >= max ) {
         mips.print_di(1);
         number = number - max;
      } else {
         mips.print_di(0);
      }
   }
   mips.print_ci('\n');
   return number;
}



public static int value_of_max(int number) {

   int max;

   max = 10;
   for (int i=0;  number >= max ;i++) {
      if( i > 8) break;
      max = max * 10;
   }
   return max;
}