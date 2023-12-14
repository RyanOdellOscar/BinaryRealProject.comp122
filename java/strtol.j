public static int strtol( char[] buffer, int radix) {

            
    int retval;  
    int i;
    int digit;

    double value;
    double denom;

    value = 0;
    denom = radix;

    for (i=0; buffer[i] != '\0'; i++) {
        digit = glyph2int(buffer[i], radix);

        if (digit == -1) break;
        value = value +  digit / denom;
        denom = denom * radix;
        

    }

    for (; i > 0 ;) {
        value = value * radix;
        i--;
    }
    return (int) value;
}    


public static int glyph2int(char c, int radix) {
    int value;
    value = -1;

    if ('0' <= c && c <= '9') {
        value = c - '0';
    }
    if ('a' <= c && c <= 'f') {
        value = c - 'a' + 10;
    }
    if ('A' <= c && c <= 'F') {
        value = c - 'A' + 10;
    }
    if (value >= radix) {
        value = -1;
    }
    return value;
}
        

