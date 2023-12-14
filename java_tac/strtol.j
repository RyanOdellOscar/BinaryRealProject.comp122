public static int strtol(char[] buffer, int radix) {

        int i;
        char glyph;
        int digit;
        int value;
        int neg_one;

        double d_value;
        double d_radix;
        double d_denom;
        double d_fraction;
        double d_digit;


        neg_one = -1;

        d_value = (double) 0;
        d_radix = (double) radix;
        d_denom = (double) d_radix;

        i = 0;
        glyph = buffer[i];
loop1:  for (; glyph != '\0' ;) {
           digit = glyph2int(glyph, radix);

           if (digit == -1 ) break loop1;

           d_digit    = (double) digit;
           d_fraction = (double) d_digit / d_denom;

           d_value  = (double) d_value + d_fraction;
           d_denom  = (double) d_denom * d_radix;

           i++;
           glyph = buffer[i];
           continue loop1;
        }
done1:  ;
loop2:  for (; i > 0 ;) {
          d_value = (double) d_value * d_radix;
          i--;
          continue loop2;
        }
done2:  ;
        value = (int) d_value;
        return value;
}

public static int glyph2int(char c, int radix) {
        char glyph;
        char c_0;
        char c_9;
        char c_a;
        char c_f;
        char c_A;
        char c_F;
        int value;

        glyph = c;
        c_0 = '0';
        c_9 = '9';
        c_a = 'a';
        c_f = 'f';
        c_A = 'A';
        c_F = 'F';

init:   value = -1;

if1:    if (c_0 <= glyph) {
cons1:     if( glyph <= c_9) {
              value = glyph - c_0;
           }
        }
if2:    if (c_a <= glyph) {
cons2:     if( glyph <= c_f) {
              value = glyph - c_a;
              value = value + 10;
           }
        }
if3:    if (c_A <= glyph) {
cons3:     if( glyph <= c_F) {
              value = glyph - c_A;
              value = value + 10;
           }
        }
if4:    if (value >= radix) {
cons4:     value = -1;
        }
finish: ;
        return value;
    }
