#include<stdio.h>
#include<stdlib.h>

typedef struct __nodo
{
    int value;
    struct __nodo *next;
} node_t;

// questo sotto e' il prototipo della funzione da implementare in asm
extern int cerca(int, node_t *);

int main(int argc, char **argv)
{
    int x = atoi(argv[1]);
    int trovato = 0;

    node_t *lista = NULL; // puntatore alla testa della lista
    node_t *tempn = lista; // puntatore all'elemento corrente della lista

    // creo la lista in ordine inverso
    for (int i=2; i<argc; i++) {
        tempn = (node_t *) malloc(sizeof(node_t));
        if (!tempn) {
            printf("Errore malloc\n");
            return 1;
        }
        tempn->value = atoi(argv[i]);
        tempn->next = lista;
        lista = tempn;
    }

    printf("Lista:\n");
    tempn = lista;
    while(tempn != NULL) {
        printf("Elemento %d -> ", tempn->value);
        tempn = tempn->next;
    }
    printf(" NULL\n");

    trovato = cerca(x, lista);

    printf("Elemento da cercare %d %s trovato alla posizione %d\n", x, (trovato !=-1 ? "" : "non"), trovato);
    return 0;
}
