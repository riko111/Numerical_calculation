      SUBROUTINE ESTCND(NDIM, N, A, V, IP, Y,
     $                  ANORM, COND)
*                                            *
*     Estimate condition number of A         *
*                                            *        
       REAL A(NDIM,N),V(N),Y(N)
       INTEGER IP(N)
*
       REAL*8 T
*
       DO 10 K = 1,N 
         T = 0.0
         DO 520 I = 1, k-1
           T = T - A(IP(I),K) * DBLE(V(I))
 520     CONTINUE
         S = 1.0
         IF (T .LT. 0.0) S = -1.0
         V(K) = (S + T) * A(IP(K),K)
  10   CONTINUE
*
       DO 30 K = N, 1, -1
         T = V(K)
         DO 530 I = K+1, N
           T = T - A(IP(I),K) * DBLE(Y(IP(I)))
 530     CONTINUE
         Y(IP(K)) = T
  30   CONTINUE
*        
       YMAX = 0.0
       DO 540 I = 1, N
         IF (ABS(Y(I)) .GT. YMAX) YMAX = ABS(Y(I))
 540   CONTINUE
*
       COND = ANORM * YMAX
*
       RETURN
      END 