#include<stdio.h>
#include<stdlib.h>

extern void mm(int*, int*, int*, int);

#define N 2

void zero(int *a, int n)
{
    int i, j;
    for(i=0; i<n; i++) {
        for(j=0; j<n; j++) {
            a[i*n+j] = 0;
        }
    }
    return;
}

void print(int *a, int n)
{
    int i, j;
    for(i=0; i<n; i++) {
        for(j=0; j<n; j++) {
            printf("%d ", a[i*n+j]);
        }
        printf("\n");
    }
    return;
}

void init(int *a, int n)
{
    int i, j;
    for(i=0; i<n; i++) {
        for(j=0; j<n; j++) {
            a[i*n+j] = i*n+j;
        }
    }
    return;
}

int main(int argc, char **argv)
{
    int *a = (int *) calloc(N*N, sizeof(int));
    int *b = (int *) calloc(N*N, sizeof(int));
    int *c = (int *) calloc(N*N, sizeof(int));

    init(a, N);
    init(b, N);
    zero(c, N);

    printf("A\n");
    print(a, N);
    printf("B\n");
    print(b, N);

    mm(a, b, c, N);

    printf("Risultato\n");
    print(c, N); 
    return 0;
}
