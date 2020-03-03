      SUBROUTINE ANCOMP (NDIM, N, A, ANORM)
*                                            *
*     Compute 1-norm of A toestimate         *
*          condition number of A             *
*                                            *
        REAL A(NDIM,N)
*
        ANORM = 0.0
        DO 10 K = 1, N
          S = 0.0
          DO 520 I = 1, N
            S = S + ABS(A(I,K))
  520     CONTINUE
          IF (S .GT. ANORM) ANORM = S
  10    CONTINUE
*  
        RETURN
      END