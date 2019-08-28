#include <stdio.h>
#include <math.h>

int main(void)
{
    const float ONE = 1.0f;
    float ev = atanf(ONE);
    int k, i;
    int n;
    float h, s, err, alerr;

    printf("%14.7E\n", ev);

    printf("--- TRAP ---\n");

    for(k=1; k<=13; k++)
    {
        n = pow(2,k);
        h = 1.0f / n;
        s = 0.5f * (1.0f + 0.5f);
        
        for(i=1; i<=n-1; i++)
        {
            s = s + 1 / (1+ powf(h*i,2));
        }
        
        s = h * s;
        err = s - ev;

        if(err != 0.0f)
        {
            alerr = log10(fabsf(err));
        }
        else 
        {
            alerr = -9.9f;
        }
        printf("N=%6d　H=%9.2E　S=%13.6E　ERR=%8.1E　L(ERR)=%4.1F\n",n, h, s, err, alerr);
    }

    return 0;
}
