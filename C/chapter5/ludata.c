#include <stdio.h>
#include "sdecom.h"

void ludata(int n, float a[NDIM][NDIM], float b[NDIM])
{
    int i, j;

    for(i=0; i<n; i++){
        for(j=0; j<n; j++){
            a[i][j] = 0.0f;
        }
    }
    a[0][0] = 4.0f;
    a[0][1] = 1.0f;

    for(i=1; i<n-1; i++){
        a[i][i-1] = 1.0f;
        a[i][i] = 4.0f;
        a[i][i+1] = 1.0f;
    }
    a[n-1][n-2] = 1.0f;
    a[n-1][n-1] = 4.0f;

    for(i=0; i<n; i++){
        b[i] = 0.0f;
        for(j=0; j<n; j++) {
            b[i] +=  (a[i][j] * (j+1));
        } 
    }
}