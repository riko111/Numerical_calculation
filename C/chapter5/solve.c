#include <stdio.h>
#include "sdecom.h"

void solve(int n, float a[NDIM][NDIM], float b[NDIM], float x[NDIM], int ip[NDIM])
{
    double t;
    int i,j;

    for(i=0; i<n; i++){
        x[i] = 0.0f;
    }

    for(i=0; i<n; i++){
        t = b[ip[i]];
        for(j=0; j<i; j++){
            t = t - a[ip[i]][j] * (double)x[j];
        }
        x[i] = t;
    }

    for(i=n-1; i>-1; i--){
        t = x[i];
        for(j=i+1; j <n; j++){
            t = t - a[ip[i]][j] * (double)x[j];
        }
        x[i] = t * a[ip[i]][i];
    }
}