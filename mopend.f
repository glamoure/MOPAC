      SUBROUTINE MOPEND
      LOGICAL OPEND, NAMD
      DIMENSION ILOSE(3)
C
C   MOPEND SHUTS ALL FILES WHICH MAY HAVE BEEN OPENED
C        AND THEN STOPS THE JOB
C
      COMMON /CHANEL/ IFILES(30)
      DATA ILOSE/2,5,7/
C
C  FIRST, DELETE ALL UNWANTED FILES
C
      DO 10 I=1,3
         J=IFILES(ILOSE(I))
         INQUIRE (UNIT=J,OPENED=OPEND)
   10 IF (OPEND) CLOSE(UNIT=J,STATUS='DELETE')
C
C  NEXT, DELIBERATELY CLOSE AND KEEP ALL REMAINING OPEN FILES.
C
      DO 20 I=1,30
         INQUIRE (UNIT=IFILES(I),OPENED=OPEND,NAMED=NAMD)
         IF (OPEND) THEN
            IF(NAMD)THEN
               CLOSE(UNIT=IFILES(I),STATUS='KEEP')
            ELSE
               CLOSE(UNIT=IFILES(I),STATUS='DELETE')
            ENDIF
         ENDIF
   20 CONTINUE
C
C  FINALLY, STOP THE JOB
C
      STOP
      END