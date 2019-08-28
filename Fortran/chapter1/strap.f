*     Accumulation of round off error
      PROGRAM STRAP
        PARAMETER (ONE = 1.0)
*
        EV = ATAN(ONE)
*
        WRITE (*,2000)
2000    FORMAT (' ---- TRAP ----')
*
        DO 10  K = 1, 13
* 
            N = 2**K
            H = 1.0 / N
*
            S = 0.5 * (1.0 + 0.5)
            DO 20 I = 1, N - 1
                S = S + 1 / (1 + (H * I)**2)
  20        CONTINUE
            S = H * S
*
            ERR = S - EV
            IF (ERR .NE. 0.0) THEN
                ALERR = ALOG10 (ABS(ERR))
            ELSE
                ALERR = -9.9
            END IF
*
            WRITE (*,2001) N, H, S, ERR, ALERR
2001        FORMAT (' N=',I6,'  H=',1PE9.2,'  S=',E13.6,
     $              '  ERR=',E8.1,'  L(ERR)=',0PF4.1)
*
  10    CONTINUE
*
      END