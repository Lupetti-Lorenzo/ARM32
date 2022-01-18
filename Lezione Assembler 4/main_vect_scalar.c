#include<stdio.h>
#include<stdlib.h>

extern void vect_scalar(int *, int, int);

int main(int argc, char **argv)
{
	if (argc != 2) {
			printf("Inserire un numero come parametro \n");
			return 0;
	}
    int array[9] = {1, 2, 3, 4, 5, 6, 7, 8, 9};

    printf("Vettore iniziale: [");
    for(int i=0; i<8; i++) {
        printf("%d ", array[i]);
    }
    printf("%d]\n", array[8]);

    int x = atoi(argv[1]);

    vect_scalar(array, x, 9);

    printf("Vettore finale: [");
    for(int i=0; i<8; i++) {
        printf("%d ", array[i]);
    }
    printf("%d]\n", array[8]);
    return 0;
}
