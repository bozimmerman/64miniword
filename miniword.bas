!--------------------------------------------------
!- Friday, November 15, 2019 12:09:27 PM
!- Import of : 
!- c:\dev\_cbm\work\miniword 2.5.prg
!- Commodore 64
!--------------------------------------------------
1 GOTO10
2 OPEN1,8,15,"s0:miniword":CLOSE1
3 SAVE"miniword",8
4 END
10 REM THE BEGINNING!
20 POKE55,151:POKE56,58
30 ML=15001
40 POKE53280,2:POKE53281,10:PRINT"{yellow}{clear}"
50 GOSUB1650
60 IFPEEK(828)<>16THENPOKE828,16:LOAD"v2.5 ml",8,1
70 FORI=0TO500:NEXT:PRINT"{yellow}{clear}"
80 GOSUB750
90 X=0:Y=0:SN=1024:LN=Y:MS=ML:PRINT"{home}";:GOSUB790
100 PRINTCHR$(14)CHR$(8)CHR$(146)
110 YY=Y*40:LY=LN*40:CH=PEEK(SN+YY+X):IFCH<128THENPOKESN+YY+X,CH+128:GOTO140
120 IFLN<>0THENPOKESN+X+YY,CH-128:GOTO140
130 CH=CH-128
140 UP=0:LC=0:NP=0
150 IFX<0THENX=0
160 TL=PEEK(14999)+256*PEEK(15000)
170 IFLN<0THENLN=0
180 GETA$:IFA$=""THEN180
190 IFLN>640THEN2560
200 IFA$="{f1}"THEN910
210 IFA$="{f6}"ANDX=0THENGOSUB2500:GOTO110
220 IFA$="{f3}"THENGOSUB1780:GOTO110
230 IFA$="{f5}"THENGOSUB1910:GOTO 110
240 IFA$="{f7}"THENGOSUB2120:GOTO 110
250 IFA$="{f2}"THENGOSUB2440:GOTO110
260 IFA$="{f4}"THENGOSUB2470:GOTO110
270 IFASC(A$)=20THENGOSUB830:GOTO110
280 CS=ASC(A$):IFCS=160THENCS=32
290 IFCS>64ANDCS<91THENLC=1
300 IFCS>31ANDCS<64THENNP=1
310 IFCS>191ANDCS<233THENUP=1
320 IFUP=1ORLC=1ORNP=1THENGOSUB430:GOTO110
330 IFCS=157ANDX=0ANDY<>0THENGOTO580
340 IFCS=148THENGOSUB2060:GOTO110
350 IFCS=157ANDX=0ANDY=0THENGOSUB590:GOTO110
360 IFCS=157ANDX>0THENGOTO610
370 IFCS=17GOTO620
380 IFCS=13GOTO620
390 IFCS=145ANDY>0THENGOTO660
400 IFCS=145ANDY=0THENGOTO670
410 IFCS=29THENGOTO690
411 C1=0:C1$="{black}{white}{red}{cyan}{purple}{green}{blue}{yellow}{orange}{brown}{pink}{dark gray}{gray}{light green}{light blue}{light gray}":FORI=1TOLEN(C1$):IFA$=MID$(C1$,I,1)THENC1=1
412 NEXTI:IFC1=1THENC1=0:PRINTA$;"{clear}":GOSUB790
420 GOTO110
430 IFLC=1THENCS=CS-64
440 IFUP=1THENCS=CS-128
450 IFX=39ANDY<24THEN500
460 IFX=39ANDY=24THEN540
470 POKE1024+X+YY,CS:POKEML+X+LY,CS:X=X+1
480 GOSUB2520
490 RETURN
500 POKE1024+X+YY,CS:POKEML+X+LY,CS:GOSUB1670:IFFL=0THENX=D+1:Y=Y+1:LN=LN+1
510 IFFL=1THENFL=0:X=0:Y=Y+1:LN=LN+1
520 GOSUB2520
530 RETURN
540 POKE1024+X+YY,CH:POKEML+X+LY,CS:GOSUB1770:IFFL=0THENX=D+1:Y=24:LN=LN+1
550 IFFL=1THENFL=0:X=0:Y=24:LN=LN+1:GOSUB790
560 GOSUB2520
570 RETURN
580 POKE1024+X+YY,CH:X=39:Y=Y-1:LN=LN-1:GOTO 110
590 IFLN=0THENRETURN
600 POKE1024+X+YY,CH:X=39:LN=LN-1:LY=LN*40:MS=MS-40:GOSUB790:RETURN
610 POKE1024+X+YY,CH:X=X-1:GOTO 110
620 POKE1024+X+YY,CH:LN=LN+1:IFCS=13THENX=0
630 IFY=24THENLY=LN*40:MS=MS+40:GOSUB790:GOTO 110
640 Y=Y+1:GOTO110
650 X=0:GOTO110
660 POKE1024+X+YY,CH:Y=Y-1:LN=LN-1:GOTO110
670 IFLN=0THENGOTO110
680 POKE1024+X+YY,CH:LN=LN-1:LY=LN*40:MS=MS-40:GOSUB790:GOTO110
690 POKESN+YY+X,CH
700 IFX<39THENX=X+1:GOTO110
710 LN=LN+1
720 IFX=39ANDY=24THENMS=MS+40:X=0:GOSUB790:GOTO110
730 X=0:Y=Y+1:GOTO110
740 END
750 IFPEEK(829)=17THENRETURN
760 POKE 829,17:PRINTCHR$(14);
770 PRINT"{clear}Swift Clear...":POKE14999,0:POKE15000,0
780 SYS 49152:RETURN
790 REM SCROLL ROUTINE
800 N1=INT(MS/256):H3=N1*256:N2=MS-H3
810 POKE250,N2:POKE251,N1
820 SYS 49181:RETURN
830 IFX=0ANDY=0ANDLN=0THENRETURN
840 IFX=0ANDY=0THEN870
850 IFX=0ANDY>0THEN890
860 POKE1024+X+YY,CH:X=X-1:POKEML+X+LY,32:GOSUB2000:GOSUB2630:RETURN
870 POKE1024+X+YY,CH:LN=LN-1:X=39:MS=MS-40:GOSUB790:YY=Y*40:POKE1024+X+YY,32
880 POKEML+X+LY,32:RETURN
890 POKE1024+X+YY,CH:LN=LN-1:X=39:Y=Y-1:YY=Y*40:LY=LN*40
900 POKE1024+X+YY,32:POKEML+X+LY,32:RETURN
910 Q=PEEK(53280):FORI=0TO100:POKE53280,I:NEXTI:POKE53280,Q
920 A$="{home}{reverse on}*Command Level*{reverse off}{space*2}At Line:"+STR$(LN):A=LEN(A$)-2
930 PRINTA$;:FORI=0TO(40-A):PRINT" ";:NEXT:PRINT
940 GETA$:IFA$=""THEN940
950 A=VAL(A$)
960 IFA$="x"THEN2820
970 IFA=13THENGOSUB790:GOTO110
980 IFA$="j"THEN1070
990 IFA$="$"THENGOSUB2380:WAIT197,64,64:POKE198,0:GOSUB790:A=13:GOTO970
1000 IFA$="s"THEN1130
1010 IFA$="l"THEN1270
1020 IFA$="f"THEN2210
1030 IFA$="p"THEN1340
1040 IFA$="e"THEN1520
1045 IFA$="c"THEN3000
1050 IFA$="d"THEN1570
1060 A=13:GOTO970
1070 PRINT"{clear}{down}Jump Command."
1080 INPUT"{down}what line?";LN$:LN=VAL(LN$)
1090 IFLN$="*"THEN150
1100 IFLN>=640THENPRINT"less then 640.":FORI=0TO2000:NEXT:GOTO910
1110 IFLN<24THENMS=ML:Y=LN:X=0:GOSUB790:A=13:GOTO970
1120 IN=LN-24:MS=ML+(IN*40):Y=24:X=0:GOSUB790:GOTO100
1130 PRINT"{clear}{down}Save Command."
1140 PRINT"{down}up to line ";TL;"?"
1150 GETA$:IFA$=""THEN1150
1160 IFA$="*"THENA=13:GOTO970
1170 IFA$="y"THENGOTO1210
1180 IFA$<>"n"THEN1130
1190 PRINT"enter last line to record";:INPUTTL$:TL=VAL(TL$):IFTL$="*"THEN910
1200 GOSUB2520
1210 TL=PEEK(14999)+256*PEEK(15000)
1220 INPUT"filename";FI$:IFLEN(FI$)>16THEN1220
1230 IFFI$="*"ORFI$=""THENA=13:GOTO970
1240 OPEN1,8,15,"s0:"+FI$:CLOSE1
1250 TL=TL+1:MM=ML+(TL*40)+1:SYS 49241,FI$,8,14999,MM
1260 A=13:GOTO970
1270 PRINT"{clear}{down}Load Command."
1280 INPUT"{down}filename";FI$:IFLEN(FI$)>16THEN1270
1290 IFFI$="*"ORFI$=""THEN910
1300 FORK=1TOLEN(FI$):POKE1007+K,ASC(MID$(FI$,K,1)):NEXT
1310 POKE1007,LEN(FI$)
1320 SYS49212
1330 GOSUB790:A=13:GOTO970
1340 PRINT"{clear}{down}Print Command.":TL=TL+1
1350 PRINT"{down}up to line "TL"?"
1360 GETA$:IFA$=""THEN1360
1370 IFA$="*"THEN910
1380 IFA$="y"THENGOTO1410
1390 IFA$<>"n"THEN1340
1400 PRINT"enter last line to print";:INPUTTL$:TL=VAL(TL$):IFTL$="*"THEN910
1405 GOTO 1420
1410 TL=PEEK(14999)+256*PEEK(15000)
1420 MM=ML+(TL*40)+1
1430 OPEN4,4,7:PRINT#4,CHR$(14)
1440 FORI=0TOTL:FORT=0TO39
1450 BY=ML+(I*40)+T:BT=PEEK(BY)
1460 IFBT>0ANDBT<27THENBT=BT+64:GOTO1490
1470 IFBT>32ANDBT<64THENGOTO1490
1480 IFBT>64ANDBT<91THENBT=BT+128
1490 PRINT#4,CHR$(BT);
1500 NEXTT:NEXTI:PRINT#4
1510 CLOSE4:A=13:GOTO970
1520 PRINT"{clear}Erase Work Command...are you sure?"
1530 GETA$:IFA$="n"THEN910
1540 IFA$<>"y"THEN1530
1550 POKE198,0
1560 POKE829,5:GOSUB750:GOTO90
1570 PRINT"{clear}{down}Open Disk Channel Command."
1580 INPUT"{down}command to send:";JH$:JH$=JH$+":"
1590 IFJH$="*"THENGOTO910
1600 INPUT"command field:";JF$:JH$=JH$+JF$
1610 IFJF$="*"THENGOTO910
1620 OPEN1,8,15,JH$:CLOSE1
1630 OPEN1,8,15:INPUT#1,E1,ER$,E2,E3:PRINTE1" "ER$" "E2" "E3:CLOSE1
1640 FORI=0TO1000:NEXT:A=13:GOTO970
1650 IFPEEK(830)<>65THENPOKE830,65:PRINT"{red}v2.5...{white}easy {light gray}writing{yellow}":POKE646,7
1660 FORI=0TO500:NEXT:RETURN
1670 D=0:DD=0:DQ=0:I=0
1680 DD=PEEK(ML+LY+(X-D)):IFDD=32THEND=D-1:GOTO1720
1690 IFD>15THENFL=1:RETURN
1700 D=D+1
1710 GOTO1680
1720 FL=0:FORI=ML+LY+40TOML+LY+40+D:IFPEEK(I)<>32THENFL=1:RETURN
1730 NEXT
1740 DQ=X-D:FORI=0TOD:POKEML+(LY+40)+I,PEEK(ML+LY+(DQ+I)):NEXT
1750 FORI=DQTOX:POKEML+LY+I,32:NEXT
1760 GOSUB790:RETURN
1770 MS=MS+40:Y=23:GOSUB1670:RETURN
1780 G1=ML+(LN*40)
1790 G2=0
1800 IFPEEK(G1+G2)<>32THEN1830
1810 IFG2>39THENRETURN
1820 G2=G2+1:GOTO1800
1830 G3=39
1840 IFPEEK(G1+G3)<>32THEN1860
1850 G3=G3-1:GOTO1840
1860 G4=G3-G2:G5=G1+(20-(G4/2))
1870 FORG=0TOG4:POKE50000+G,PEEK(G1+G2+G):NEXT
1880 FORG=0TO39:POKEG1+G,32:NEXT
1890 FORG=0TOG4:POKEG5+G-2,PEEK(50000+G):NEXT
1900 GOSUB790:RETURN
1910 TL=PEEK(14999)+256*PEEK(15000):TL=TL+1
1915 IFLN>TLTHENRETURN
1920 Y1=15001+(40*(TL)):Y2=15001+(LN*40)
1930 N2=INT(Y1/256):H3=N2*256:N1=Y1-H3
1940 N4=INT(Y2/256):H3=N4*256:N3=Y2-H3
1950 POKE250,N1:POKE251,N2:POKE252,N3:POKE253,N4:SYS 49299
1960 FORI=Y2TOY2+39:POKEI,32:NEXT
1970 IFTL<=255THENPOKE14999,TL:POKE15000,0:GOTO1990
1980 UY=INT(TL/256):UU=TL-(UY*256):POKE14999,UU:POKE15000,UY
1990 GOSUB790:RETURN
2000 R=38-X:TL=PEEK(14999)+256*PEEK(15000)
2010 Y1=15001+(LN*40)+X+R+1:Y2=Y1-R
2020 FORI=Y2TOY1:POKEI-1,PEEK(I)
2030 NEXTI:POKEI-1,32
2040 REMPOKE15001+(LN*40)+X-1,32
2050 GOSUB790:RETURN
2060 IFPEEK(15001+(40*LN)+39)<>32THENRETURN
2070 R=38-X:TL=PEEK(14999)+256*PEEK(15000)
2080 Y1=15001+(LN*40)+X+R:Y2=Y1-R
2090 FORI=Y1TOY2STEP-1:POKEI+1,PEEK(I):NEXTI
2100 POKE15001+(LN*40)+X,32
2110 GOSUB790:RETURN
2120 TL=PEEK(14999)+256*PEEK(15000)
2125 IFLN>=TLTHENRETURN
2130 Y1=15001+(40*(TL)):Y2=15001+(LN*40)
2140 N2=INT(Y1/256):H3=N2*256:N1=Y1-H3
2150 N4=INT(Y2/256):H3=N4*256:N3=Y2-H3
2160 POKE250,N1:POKE251,N2:POKE252,N3:POKE253,N4:SYS 49353
2170 FORI=Y1TOY1+39:POKEI,32:NEXT:TL=TL-1
2180 IFTL<=255THENPOKE14999,TL:POKE15000,0:GOTO1990
2190 UY=INT(TL/256):UU=TL-(UY/256):POKE14999,UU:POKE15000,UY
2200 GOSUB790:RETURN
2210 PRINT"{clear}{down*2}String to search for:";:POKE19,1:INPUT YS$:POKE19,0:PRINTCHR$(13)
2220 TL=PEEK(14999)+(256*PEEK(15000)):IFYS$=""ORYS$="*"THEN910
2221 FORI=1TOLEN(YS$):BT=ASC(MID$(YS$,I,1))
2222 IFBT>64ANDBT<(64+27)THENBT=BT-64:GOTO2225
2223 IFBT>32ANDBT<64THEN2225
2224 IFBT>(64+128)ANDBT<(91+128)THENBT=BT-128
2225 SY$=SY$+CHR$(BT):NEXT
2230 PRINT"what line do I start at";:INPUTL1:L1=L1-1:IFL1<0THEN910
2240 PRINT"what line do I stop at{space*4}"TL"{left*5}";:INPUTL2
2250 IFL2>TLORL1>TLORL2<1THEN910
2260 FD$="":PRINT"{clear}":FORI=(15001+(40*L1))TO(15041+(40*L2))
2270 BT=PEEK(I):IFBT=ASC(LEFT$(SY$,1))THEN2290
2280 PRINT"{home}{down}searching line";INT((I-15001)/40);"{left} ":GOTO2330
2290 Q$="":FORT=ITO(I+LEN(SY$)-1):BT=PEEK(T):Q$=Q$+CHR$(BT):NEXTT
2300 IFQ$=SY$THENPRINT"found at line";:L=INT((I-15001)/40):PRINTL:L$=STR$(L)
2310 IFQ$<>SY$THEN2340
2320 FD$=FD$+L$+","
2330 IFLEN(FD$)>=250THEN2860
2340 NEXTI
2350 PRINT"string found at lines:"
2360 PRINTFD$:PRINT"press any key..."
2370 WAIT197,64,64:POKE198,0:A=13:GOTO970
2380 PRINT"{clear}";:OPEN2,8,0,"$":GET#2,A$:GET#2,A$
2390 GET#2,L$:GET#2,L$:IFST=64THENCLOSE2:PRINT"{ct j}hit any key":RETURN
2400 GET#2,LB$:GET#2,HB$:VG=ASC(LB$+CHR$(0))+256*ASC(HB$+CHR$(0))
2410 PRINTVG;
2420 WAIT653,1,1:GET#2,A$:IFA$=""THENPRINTCHR$(13);:GOTO2390
2430 PRINTA$;:GOTO2420
2440 A=PEEK(53280):A=A+1
2450 IFA=256THENA=0
2460 POKE53280,A:RETURN
2470 A=PEEK(53281):A=A+1
2480 IFA=256THENA=0
2490 POKE53281,A:RETURN
2500 X=X+6:YY=Y*40:LY=LN*40:CH=PEEK(1024+YY):POKESN+YY,CH-128
2510 RETURN
2520 IFLN>=640THEN2560
2530 IFLN<PEEK(14999)+256*PEEK(15000)THENRETURN
2540 IFLN<=255THENPOKE14999,LN:POKE15000,0:RETURN
2550 QW=INT(LN/256):WQ=LN-256*QW:POKE14999,WQ:POKE15000,QW:RETURN
2560 LN=0:PRINT"{clear}"
2570 X=0:Y=0:YY=1024+Y*40:MS=ML:GOSUB790:GOTO110
2580 PRINT"{space*17}(The Author)"
2590 IFBT>0ANDBT<27THENBT=BT+64:RETURN
2600 IFBT>32ANDBT<64THENRETURN
2610 IFBT>64ANDBT<91THENBT=BT+128:RETURN
2620 RETURN
2630 M1=ML+(40*LN)-1:IFX>15THENRETURN
2640 M2=ML+(40*LN):IFPEEK(M2)=32THENRETURN
2650 N1=0:N2=0:N3=0:M3=ML+(40*(LN+1))-1
2660 B=PEEK(M2+N1):IFB=32THEN2680
2670 N1=N1+1:GOTO2660
2680 IFX>N1THENRETURN
2690 B=PEEK(M1-N2):IFB<>32THEN2720
2700 N2=N2+1
2710 GOTO 2690
2720 IFN2<=N1+1THENRETURN
2730 B=PEEK(M3-N3):IFB<>32THEN2760
2740 N3=N3+1:IFN3>59THENRETURN
2750 GOTO 2730
2760 FORI=0TON1:POKE(M1-N1+I),PEEK(M2+I):NEXT
2770 FORI=0TOP:POKEM2+I,32:NEXT
2780 FORI=N1TO40:POKE(M2+I-N1-1),PEEK(M2+I):NEXT
2790 FORI=M3-N1-N3+1TOM3:POKEI,32:NEXT
2800 IFX<=N1THENX=39-N1+X:LN=LN-1:Y=Y-1
2810 GOSUB790:RETURN
2820 PRINT"{clear}Exit. Are you sure?"
2830 GETA$:IFA$="n"THEN910
2840 IFA$<>"y"THEN2830
2850 POKE2048,0:SYS2048
2860 PRINT"I'm sorry but there are too
2870 PRINT"many references to this string"
2880 PRINT"to keep track of..."
2890 PRINT"{down}press any key":POKE198,0:WAIT 197,64,64
2900 GOSUB790:GOTO110
3000 C1$="":C2$="":PRINT"{clear}Calculator mode"
3010 PRINT"{down}Hit Clr to exit"
3020 PRINT"Hit Shft/Clr to clear"
3030 PRINT"{cm r*25}
3040 PRINT"{cm q}{space*23}{cm w}
3050 PRINT"{cm e*25}
3060 GETA$:IFA$=""THEN3060
3070 IFA$="0"OR(VAL(A$)>=1ANDVAL(A$)<=9)THEN3200
3080 IFA$="+"ORA$="-"ORA$="*"ORA$="^"ORA$="/"THENGOSUB3500:GOTO3060
3090 IFA$="="THENGOSUB3500:GOTO3060
3100 IFA$="{home}"THENA=13:GOTO970
3110 IFA$="{clear}"THENC1$="":C2$="":OP$="":PRINT"{home}{down*5}{right}{space*19}":GOTO3060
3120 GOTO3060
3200 IFOP$=""THENC1$=C1$+A$:C1=VAL(C1$):C1$=STR$(C1):PRINT"{home}{down*5}{right}";C1$:GOTO3060
3205 IFC1$<>""ANDC2$=""THENPRINT"{home}{down*5}{right}{space*10}"
3210 C2$=C2$+A$:C2=VAL(C2$):C2$=STR$(C2):PRINT"{home}{down*5}{right}";C2$:GOTO3060
3500 IFOP$=""ANDA$<>"="THENOP$=A$:PRINT"{home}{down*5}{right}{space*19}":RETURN
3510 IFOP$=""ANDA$="="THENRETURN
3515 C1=VAL(C1$):C2=VAL(C2$)
3520 IFOP$="+"THENC1=C1+C2:GOTO3700
3530 IFOP$="*"THENC1=C1*C2:GOTO3700
3540 IFOP$="-"THENC1=C1-C2:GOTO3700
3550 IFOP$="/"ANDC2<>0THENC1=C1/C2
3560 IFOP$="^"THENC1=C1^C2
3700 IFA$<>"="THEN3720
3705 C1$=STR$(C1):PRINT"{home}{down*5}{right}";C1$;"{space*15}"
3710 C2$="":OP$="":RETURN
3720 C1$=STR$(C1):PRINT"{home}{down*5}{right}";C1$;"{space*5}":C2$=""
3730 IFA$<>OP$THENOP$=A$:RETURN
3740 RETURN
