#include<stdio.h>
#include<stdlib.h>

extern void sumvect(int *x, int *y, int *z, int n);

int main()
{
    int x[8] = {1, 2, 3, 4, 5, 6, 7, 8};
    int y[8] = {8, 7, 6, 5, 4, 3, 2, 1};
    int *z = (int *) malloc(sizeof(int) * 8);
    int i = 0;

    if (!z) {
        printf("Errore malloc()\n");
        exit(1);
    }

    sumvect(x, y, z, 8);

    printf("z = [");
    for (i=0; i<7; i++) {
        printf("%d, ", z[i]);
    }
    printf("%d]\n", z[7]);

    return 0;
}
