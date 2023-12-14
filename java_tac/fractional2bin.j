public static int fractional2bin(int fractional, int max_bits) {
         int max;
         int number;
         int bits;

         max = value_of_max(fractional);
         number = fractional;
         bits = 0;

loop:    while (number != 0) {
            if(bits >= max_bits) break loop;
            bits++;
            number = number * 2; 
            if ( number >= max ) {
cons:          mips.print_di(1);
               number = number - max;
               continue loop;
            } else {
alt:           mips.print_di(0);
               continue loop;
            }
         }
done:    ;
         mips.print_ci('\n');
         return number;
      }

public static int value_of_max(int number) {

         int _8;
         int _10;

         int max;
         int i;

         _8  =  8;
         _10 = 10;

         max = 10;
         i   =  0;

loop2:   for (; number >= max ;) {
            if( i > _8) break loop2;
            max = max * _10;
            i++;
            continue loop2;
         }
done2:   ;
         return max;
}