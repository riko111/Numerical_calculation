      PROGRAM SDECOM
*                                                *
*       Sample program of DECOMP and SOLVE       *
*                                                *
      PARAMETER (NDIM = 20)
*
      REAL A(NDIM,NDIM),B(NDIM),X(NDIM)
      REAL W(NDIM),V(NDIM)
      INTEGER IP(NDIM)
*
      DO 10 NN = 1, 2
*
        N = 10 * NN
*
        CALL LUDATA (NDIM, N, A, B)
*
        CALL ANCOMP (NDIM, N, A, ANORM)
*
        WRITE (*,2000) ANORM
 2000   FORMAT (/' ---- DECOMP and SOLVE ----'/
     $           ' 1-norm of A = ',1PE13.6)

        CALL DECOMP (NDIM, N, A, W, IP)

        CALL SOLVE (NDIM, N, A, B, X, IP)

        CALL ESTCND (NDIM, N, A, V, IP, W,
     $               ANORM, COND)
*
        WRITE (*,2001) (X(I), I=1,N)
 2001   FORMAT (' solution X(I)'/(1X,5F9.5))
*
        WRITE (*,2002) COND
 2002   FORMAT (' condition number = ',1PE13.6)
*
   10 CONTINUE
*   
      END
