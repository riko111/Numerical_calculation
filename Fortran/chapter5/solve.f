      SUBROUTINE SOLVE (NDIM, N, A, B, X, IP)
*                                            *
*     Solve system of linear equations       *
*                 A * X = B                  *
*                                            *
        REAL A(NDIM,N),B(N),X(N)
        INTEGER IP(N)
*
        REAL*8 T
*
*       ---- forward substitution ----
*
        DO 10 I = 1,N
          T = B(IP(I))
          DO 520 J = 1, I-1
            T = T - A(IP(I),J) * DBLE(X(J))
  520     CONTINUE
          X(I) = T
   10   CONTINUE
*
*       ---- backward substitution ----
*
        DO 30 I = N, 1, -1
          T = X(I)
          DO 540 J = I+1, N
            T = T - A(IP(I),J) * DBLE(X(J))
  540     CONTINUE
          X(I) = T * A(IP(I),I)
   30   CONTINUE
*
        RETURN
      END