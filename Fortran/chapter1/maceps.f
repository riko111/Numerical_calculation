      SUBROUTINE MACEPS(EPSMAC)
        EPSMAC = 1.0
100    CONTINUE
       IF (1.0 + EPSMAC .LE. 1.0) THEN
        EPSMAC = 2 * EPSMAC
        RETURN
       END IF
       EPSMAC = EPSMAC * 0.5
       GO TO 100
      END 
    
      program maceps_main
        call maceps(epsmac)
        write(*,*)epsmac
      end program maceps_main