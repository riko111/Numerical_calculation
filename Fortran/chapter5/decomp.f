      SUBROUTINE DECOMP (NDIM, N, A, W, IP)
*                                            *
*     LU decomposition of N * N matrix A     *
*                                            *
        REAL A(NDIM,N),W(N)
        INTEGER IP(N)
*
        DATA EPS / 1.0E-75 /
*
        DO 510 K = 1, N
          IP(K) = K
  510   CONTINUE
*
        DO 10 K = 1, N
          L = K
          AL = ABS(A(IP(L),K))
          DO 520 I = K+1, N 
            IF (ABS(A(IP(I),K)) .GT. AL) THEN
                L = I
                AL = ABS(A(IP(L),K))
            END IF
  520     CONTINUE
*
          IF (L .NE. K) THEN
*
*             ---- row exchange ----
*
            LV = IP(K)
            IP(K) = IP(L)
            IP(L) = LV
          END IF
*
          IF (ABS(A(IP(K),K)) .LE. EPS) GO TO 900
*
*             ---- Gauss elimination ----
*
            A(IP(K),K) = 1.0 /  A(IP(K),K)

            DO 30 I = K+1, N
              A(IP(I),K) = A(IP(I),K) * A(IP(K),K)
              DO 540 J = K+1, N 
                W(J) = A(IP(I),J) - A(IP(I),K) * A(IP(K),J)
  540         CONTINUE
              DO 550 J = K+1, N
                A(IP(I),J) = W(J)
  550         CONTINUE
   30       CONTINUE
*          
   10   CONTINUE
*
        RETURN
*
*       ---- matrix singular ----
*
  900   CONTINUE
        WRITE (*,2001) K
 2001   FORMAT (' (DECOMP) matrix singular ( at ',I4,
     $          '-th pivot)')
        N = - K
        RETURN
*
      END