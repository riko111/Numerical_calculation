#ifndef NDIM
#define NDIM 20
#endif
void ludata(int n, float a[NDIM][NDIM], float b[NDIM]);
float ancomp(int n, float a[NDIM][NDIM]);
int decomp(int n, float a[NDIM][NDIM], float w[NDIM], int ip[NDIM]);
void solve(int n, float a[NDIM][NDIM], float b[NDIM], float x[NDIM], int ip[NDIM]);
float estcnd(int n, float a[NDIM][NDIM], float v[NDIM], int ip[NDIM], float y[NDIM], float anorm);