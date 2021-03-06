char cifra(char c, int n)
{
    unsigned int cc = c;
    // codice ASCII di 'a' = 0x61
    // codice ASCII di 'z' = 0x7a
    if (c <= 'z' && c >= 'a') {
        cc = c + n;
        if(cc > 'z') {
            cc = cc - 'z' +  'a' - 1;
        }
    } 
    return ((char) cc);
}

int cambia(char *s, int l)
{
    int ls = strlen(s);
    int sum = 0;
    for(int i=0; i<ls; i++) {
        int cc = cifra(s[i], l);
        if(cc != s[i]) {
            s[i] = cc;
            sum++;
        }
    }
    return sum;
}
