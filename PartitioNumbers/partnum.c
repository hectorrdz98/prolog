/********************************************************************
    Programa: partnum.c
********************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int *a;
int p = 0, total = 0;
int detalle = 1;

void imprime() {
    int i;
    printf("%4d:  ",++total);
    for(i=0; i<p-1; ++i) printf("%d + ",a[i]);
    printf("%d\n",a[i]);
}

int min(int a, int b) {
    return (a <= b) ? a : b;
}

void partnum(int n, int max) {
    int i;
    if(n == 0) {
        if(detalle) imprime(); else total++;
    } else
        for(i=min(n,max); i>=1; --i) {
            a[p++] = i;
            partnum(n-i,i);
            --p;
        }
}

int main(int narg, char *arg[]) {
    int n;
    time_t inicio, fin;
    if(narg > 1) detalle = 0;
    printf("n: "); scanf("%d",&n);
    a = (int *) malloc(sizeof(int) * n);
    inicio = time(NULL);
    partnum(n,n);
    fin = time(NULL);
    free(a);
    printf("Soluciones = %d, Tiempo = %ld segundos\n",
        total,fin-inicio);
    return 0;
}