#include <stdio.h>
#include <float.h>

void maceps(float *epsmac){
    *epsmac = 1.0f;
    while((1.0f + *epsmac) > 1.0f)
    {
        *epsmac *= 0.5;
    }
    *epsmac *=2;
}

int main(void){
    float epsmac;

    maceps(&epsmac);

    printf("%.8E\n", epsmac);
    printf("%.8E\n", FLT_EPSILON);

    return 0;
}
