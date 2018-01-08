      PROGRAM MAIN

      REAL*8 ERROR
      DIMENSION ERROR(60)
C DO-CONTINUE
      DO 10 I=1,10
          WRITE(*,*) I
10    CONTINUE

C GOTO
      E = 1D0
      DO 20 I=1,2
      DO 20 II=1,2
      DO 20 III=1,2
          E = E/DBLE(III)
          WRITE(*,*) E
          IF(E < 1D-9) GOTO 20
20    CONTINUE
      
C FORMAT
      X=10D0
      Y=20D0
      WRITE(*,100) X,Y
100   FORMAT(E10.1,E10.1)
      
C READ
      OPEN(UNIT=5,FILE="DATA.TXT")
      DO 200 I=1,10000
          READ(5,*,END=210) E
          ERROR(I) = E
200   CONTINUE
210   WRITE(*,*) ERROR
      CLOSE(5)

      END