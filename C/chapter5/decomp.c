#include <stdio.h>
#include <math.h>
#include <float.h>
#include "sdecom.h"

int decomp(int n, float a[NDIM][NDIM], float w[NDIM], int ip[NDIM])
{
    //double eps = 1.0e-75;
    int i,j,k,l;
    float al;
    int lv;

    for(k=0; k<n; k++){
        ip[k] = k;
    }
    

    for(k=0; k<n; k++){
        l = k;
        al = fabsf(a[ip[l]][k]);
        for(i=k+1; i<n; i++){
            if(fabsf(a[ip[i]][k]) > al) {
                l = i;
                al = fabsf(a[ip[l]][k]);
            }
        }
        
        if(l != k) {
            lv = ip[k];
            ip[k] = ip[l];
            ip[l] = lv;
        }
        
        if((fabsf(a[ip[k]][k]) <= DBL_EPSILON)) {
            printf(" (DECOMP) matrix singular ( at %4d-th pivot)\n", k);
            n = -k;
            break;
        } else {
            a[ip[k]][k] = 1.0f / a[ip[k]][k];
            for(i=k+1; i<n; i++) {
                a[ip[i]][k] = a[ip[i]][k] * a[ip[k]][k];
                for(j=k+1; j<n; j++) {
                    w[j] = a[ip[i]][j] - a[ip[i]][k] * a[ip[k]][j];
                }
                for(j=k+1; j<n; j++) {
                    a[ip[i]][j] = w[j];
                }
            }
        } 
    }
    return n;
}
