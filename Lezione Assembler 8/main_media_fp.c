#include<stdio.h>
#include<stdlib.h>

extern void media(int *, double *);

int main(int argc, char **argv)
{
    int *v = (int *) malloc(argc * sizeof(int));
    int i;
    double x; 

    for(i=1; i<argc; i++) {
        v[i-1] = atoi(argv[i]);
    }
    v[argc-1] = -1;

    media(v, &x);

    // la printf per %f vuole sempre un double
    printf("La media vale %f\n", x);
    return(0);
}
