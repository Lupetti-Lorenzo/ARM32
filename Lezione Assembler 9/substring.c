#include<string.h>

int match(char *uno, char *due, int l)
{
    int res = 1;
    for (int i=0; i<l; i++) {
        if (uno[i] != due[i]) {
            res = 0;
            break;
        }
    }
    return res;
}

int substring(char *stringa, char *parola)
{
    int ls = strlen(stringa);
    int lp = strlen(parola);

    int trovata = -1;
    for (int i=0; i<(ls - lp + 1); i++) {
        if (match(&stringa[i], parola, lp) == 1) {
            trovata = i;
            break;
        }
    }
    return trovata;
}
