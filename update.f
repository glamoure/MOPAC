      SUBROUTINE UPDATE(IPARAM, IELMNT, PARAM, KFN)
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
************************************************************************
*
*  UPDATE UPDATES THE COMMON BLOCKS WHICH HOLD ALL THE PARAMETERS FOR
*         RUNNING MNDO.
*         IPARAM REFERS TO THE TYPE OF PARAMETER,
*         IELMNT REFERS TO THE ELEMENT,
*         PARAM IS THE VALUE OF THE PARAMETER, AND
*
************************************************************************
      COMMON /MNDO/  USSM(107), UPPM(107), UDDM(107), ZSM(107),ZPM(107),
     1ZDM(107), BETASM(107), BETAPM(107), BETADM(107), ALPM(107),
     2EISOLM(107), DDM(107), QQM(107), AMM(107), ADM(107), AQM(107)
     3,GSSM(107),GSPM(107),GPPM(107),GP2M(107),HSPM(107), POLVOM(107)
      COMMON /EXPONT/ ZS(107),ZP(107),ZD(107)
     1       /NATORB/ NATORB(107)
     2       /BETAS / BETAS(107),BETAP(107),BETAD(107)
     3       /VSIPS / VS(107),VP(107),VD(107)
     4       /ONELEC/ USS(107),UPP(107),UDD(107)
     5       /MULTIP/ DD(107),QQ(107),AM(107),AD(107),AQ(107)
     6       /TWOELE/ GSS(107),GSP(107),GPP(107),GP2(107),HSP(107)
     7                ,GSD(107),GPD(107),GDD(107)
     8       /ALPHA / ALP(107)
     9       /IDEAS / GUESS1(107,10), GUESS2(107,10), GUESS3(107,10)
      COMMON /GAUSS / FN1(107),FN2(107)
C* SHIHAO'S MODIFICATION START *************************************
C* Added:
C*  Additional user-defined parameters
      COMMON /UDPAR/ UDEISOL(107),UDDD(107),UDQQ(107),UDRHO0(107),
     1               UDRHO1(107),UDRHO2(107)
      COMMON /PDDG/  PGF1(107,10), PGF2(107,10),PGF3(107,10)
      COMMON /PWGFP/ PWGF1(10,2), PWGF2(10,2),PWGF3(10,2),
     1               PWGFIJ(10)
C* SHIHAO'S MODIFICATION END ***************************************
      GOTO
     1(10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,
C* SHIHAO'S MODIFICATION START *************************************
C* Added:
     2 190,200,210,220,230,240,250,260,270,280,290,300,310,320,330,340,
     3 350,360,370),IPARAM
C* Removed:
C*      2190,200,210,220,230,240,250),IPARAM
C* SHIHAO'S MODIFICATION END ***************************************
   10 USS (IELMNT)=PARAM
      USSM(IELMNT)=PARAM
      RETURN
   20 UPP (IELMNT)=PARAM
      UPPM(IELMNT)=PARAM
      RETURN
   30 UDD (IELMNT)=PARAM
      UDDM(IELMNT)=PARAM
      RETURN
   40 ZS (IELMNT)=PARAM
      ZSM(IELMNT)=PARAM
      RETURN
   50 ZP (IELMNT)=PARAM
      ZPM(IELMNT)=PARAM
      RETURN
   60 ZD (IELMNT)=PARAM
      ZDM(IELMNT)=PARAM
      RETURN
   70 BETAS (IELMNT)=PARAM
      BETASM(IELMNT)=PARAM
      RETURN
   80 BETAP (IELMNT)=PARAM
      BETAPM(IELMNT)=PARAM
      RETURN
   90 BETAD (IELMNT)=PARAM
      BETADM(IELMNT)=PARAM
      RETURN
  100 GSS (IELMNT)=PARAM
      GSSM(IELMNT)=PARAM
      RETURN
  110 GSP (IELMNT)=PARAM
      GSPM(IELMNT)=PARAM
      RETURN
  120 GPP (IELMNT)=PARAM
      GPPM(IELMNT)=PARAM
      RETURN
  130 GP2 (IELMNT)=PARAM
      GP2M(IELMNT)=PARAM
      RETURN
  140 HSP (IELMNT)=PARAM
      HSPM(IELMNT)=PARAM
      RETURN
  150 RETURN
  160 RETURN
  170 RETURN
  180 ALP (IELMNT)=PARAM
      ALPM(IELMNT)=PARAM
      RETURN
  190 RETURN
  200 RETURN
  210 RETURN
C* SHIHAO'S MODIFICATION START *************************************
C* Added:
  220 UDEISOL(IELMNT)=PARAM
      RETURN
  230 UDDD(IELMNT)=PARAM
      RETURN
  240 UDQQ(IELMNT)=PARAM
      RETURN
  250 UDRHO0(IELMNT)=PARAM
      RETURN
  260 UDRHO1(IELMNT)=PARAM
      RETURN
  270 UDRHO2(IELMNT)=PARAM
      RETURN
  280 GUESS1(IELMNT,KFN)=PARAM
      RETURN
  290 GUESS2(IELMNT,KFN)=PARAM
      RETURN
  300 GUESS3(IELMNT,KFN)=PARAM
      RETURN
  310 NATORB(IELMNT)=PARAM
      I=INT(PARAM+0.5)
      IF(I.NE.9.AND.I.NE.4.AND.I.NE.1)THEN
         WRITE(6,'(///10X,'' UNACCEPTABLE VALUE FOR NO. OF ORBITALS'',
     1'' ON ATOM'')')
         STOP
      ENDIF
      RETURN
  320 PGF1(IELMNT,KFN)=PARAM
      RETURN
  330 PGF2(IELMNT,KFN)=PARAM
      RETURN
  340 PGF3(IELMNT,KFN)=PARAM
      RETURN
      
  350 DO 355 I=1,10
         IF(PWGFIJ(I).EQ.IELMNT) GOTO 357
         IF(PWGFIJ(I).EQ.0) GOTO 356
  355 CONTINUE
  356 PWGFIJ(I)=IELMNT
  357 PWGF1(I,KFN)=PARAM
      RETURN
      
  360 DO 365 I=1,10
         IF(PWGFIJ(I).EQ.IELMNT) GOTO 367
         IF(PWGFIJ(I).EQ.0) GOTO 366
  365 CONTINUE
  366 PWGFIJ(I)=IELMNT
  367 PWGF2(I,KFN)=PARAM
      RETURN

  370 DO 375 I=1,10
         IF(PWGFIJ(I).EQ.IELMNT) GOTO 377
         IF(PWGFIJ(I).EQ.0) GOTO 376
  375 CONTINUE
  376 PWGFIJ(I)=IELMNT
  377 PWGF3(I,KFN)=PARAM
      RETURN
C* Removed:
C  220 GUESS1(IELMNT,KFN)=PARAM
C      RETURN
C  230 GUESS2(IELMNT,KFN)=PARAM
C      RETURN
C  240 GUESS3(IELMNT,KFN)=PARAM
C      RETURN
C  250 NATORB(IELMNT)=PARAM
C      I=INT(PARAM+0.5)
C      IF(I.NE.9.AND.I.NE.4.AND.I.NE.1)THEN
C         WRITE(6,'(///10X,'' UNACCEPTABLE VALUE FOR NO. OF ORBITALS'',
C     1'' ON ATOM'')')
C         STOP
C      ENDIF
C* SHIHAO'S MODIFICATION END ***************************************
      END
