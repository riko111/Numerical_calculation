      SUBROUTINE LUDATA (NDIM, N, A, B)
*                                                 *
*         Sample data of DECOMP and SOLVE         *
*                                                 *
        REAL A(NDIM,N),B(N)

        DO 510 I =1, N
          DO 520 J = 1, N
            A(I,J) = 0.0
  520     CONTINUE
  510  CONTINUE
*
        A(1,1) = 4.0
        A(1,2) = 1.0

        DO 530 I = 2, N - 1
           A(I,I-1) = 1.0
           A(I,I)   = 4.0
           A(I,I+1) = 1.0
  530   CONTINUE

        A(N,N-1) = 1.0
        A(N,N)   = 4.0

        DO 540 I = 1, N
          B(I) = 0.0
          DO 550 J = 1, N
            B(I) = B(I) + A(I,J) * J
  550     CONTINUE
  540   CONTINUE
*
        RETURN
      END