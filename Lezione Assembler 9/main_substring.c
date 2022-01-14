#include<stdio.h>
#include<string.h>

extern int match(char *uno, char *due, int len);
extern int substring(char *stringa, char *parola);

int main(int argc, char **argv)
{
    char *stringa = "cercare in questa stringa";
    char *p1  = "questa";
    char *p2  = "cercare";
    char *p3  = "stringa";

    int t1 = substring(stringa, p1);
    int t2 = substring(stringa, p2);
    int t3 = substring(stringa, p3);

    if (t1 == 11 && t2 == 0 && t3 == 18) {
        printf("Corretto\n");
    }
    else {
        printf("Sbagliato\n");
    }
    return 0;
}
