#include<stdio.h>
#include<stdlib.h>

typedef struct __nodo
{
    int value;
    struct __nodo *next;
} node_t;

int cerca(int x, node_t *p)
{
    int pos = 0;
    while (p != NULL) {
        pos++;
        if (p->value == x) {
            return pos;
        }
        p = p->next;
    }
    return -1;
}
