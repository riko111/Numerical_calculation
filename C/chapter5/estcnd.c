#include <stdio.h>
#include <math.h>
#include "sdecom.h"

float estcnd(int n, float a[NDIM][NDIM], float v[NDIM], int ip[NDIM], float y[NDIM], float anorm)
{
    float cond;

    double t;
    int i,k;
    float s;
    float ymax;

    for(k=0; k<n; k++){
        t = 0.0;
        for(i=0; i<k; i++){
            t = t - a[ip[i]][k] * (double)v[i];
        }
        s = 1.0f;
        if( t < 0.0f) {
            s = -1.0f;
        }
        v[k] = (s + t) * a[ip[k]][k];
    }

    for(k=n-1; k>-1; k--){
        t = v[k];
        for(i=k+1; i<n; i++){
            t = t - a[ip[i]][k] * (double)y[ip[i]];
        }
        y[ip[k]] = t;
    }

    ymax = 0.0f;
    for(i=0; i<n; i++){
        if(fabsf(y[i]) > ymax){
            ymax = fabsf(y[i]);
        }
    }

    cond = anorm * ymax;
    return cond;
}