#include<stdio.h>
#include<stdlib.h>

extern unsigned int sumpow(int, unsigned int);

int main(int argc, char **argv)
{
    int x = atoi(argv[1]);

    if (x == 0) {
        printf("x non può essere 0\n");
        return 0;
    }

    int n = atoi(argv[2]);

    printf("sumpow(%d,%d)=%d\n", x, n, sumpow(x, n));
    return 0;
}
