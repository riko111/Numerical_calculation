#include <stdio.h>
#include<stdlib.h>
#include "sdecom.h"

int main(void)
{

    float a[NDIM][NDIM], b[NDIM], x[NDIM];
    float w[NDIM], v[NDIM];
    int ip[NDIM];

    int nn;
    int n;

    float anorm, cond;
    int i,j;

    for(nn = 1; nn < 3; nn++){
        n = 10 * nn;

        ludata(n, a, b);
        anorm = ancomp(n, a);
        printf(" ---- DECOMP and SOLVE ----\n 1-norm of A = %13.6E\n"
        , anorm);

        n = decomp(n, a, w, ip);
        solve(n, a, b, x, ip);

        cond = estcnd(n, a, v, ip, w, anorm);

        printf(" solution X(I)\n");
        for(i=0; i<n; i++){
            if(i != 0 && i % 5 == 0) {
                printf("\n");
            }
            printf(" %.5f", x[i]);
        }

        printf("\n condition number = %13.6E\n", cond);

    }

    return 0;
}