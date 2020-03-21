#include <stdio.h>
#include <math.h>
#include "sdecom.h"

float ancomp(int n, float a[NDIM][NDIM])
{
    int i,k;
    float s;

    float anorm = 0.0f;

    for(k=0; k<n; k++){
        s = 0.0f;
        for(i=0; i<n; i++) {
            s = s + fabsf(a[i][k]);
        }
        if (s > anorm){
            anorm = s;
        } 
    }

    return anorm;
}