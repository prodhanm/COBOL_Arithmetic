       IDENTIFICATION DIVISION. 
       PROGRAM-ID. divi.
      *
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01 WS-NUM1   PIC 9(05).
       01 WS-NUM2   PIC 9(05).
       01 WS-RESULT PIC 9(07)v9(2).
      *
       PROCEDURE DIVISION.
       000-MAIN-PROCESS.
           PERFORM 100-ACCEPT-NUM.
           PERFORM 200-CALC-NUM.
           PERFORM 300-DISPLAY-NUM.
           STOP RUN.
      *
       100-ACCEPT-NUM.
           ACCEPT WS-NUM1.
           ACCEPT WS-NUM2.
           ACCEPT WS-RESULT.
           PERFORM 110-VALIDATE-NUM.
       110-VALIDATE-NUM.
           IF WS-NUM1 IS NOT NUMERIC 
              DISPLAY 'INVALID FORMAT OF NUM1'
              STOP RUN
           ELSE
              IF WS-NUM2 IS NOT NUMERIC 
                 DISPLAY 'INVALID FORMAT OF NUM2'
                 STOP RUN
              END-IF 
           END-IF.
      *
       200-CALC-NUM.
           COMPUTE WS-RESULT = WS-NUM1 / WS-NUM2
              ON SIZE ERROR DISPLAY "ZERO DIVISION ERROR!"
              MOVE " ERROR!" TO WS-RESULT
           END-COMPUTE.
      *
       300-DISPLAY-NUM.
           DISPLAY WS-NUM1 ' / ' WS-NUM2 ' = ' WS-RESULT.