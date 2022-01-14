#include<stdio.h>
#include<stdlib.h>

extern int greater_fp(float *array, int len, float val);

int main(int argc, char **argv)
{
    int i = 0;
    float x[8] = {1.3, 2.5, 3.15, 4.22, 5.43, 6.12, 7.42, 8.029};

    double val = atof(argv[1]);

    int ris = greater_fp(x, 8, (float) val);

    printf("x = [");
    for (i=0; i<7; i++) {
        printf("%f, ", x[i]);
    }
    printf("%f]\n", x[7]);

    printf("Ci sono %d numeri più grossi di %f\n", ris, val);

    return 0;
}
