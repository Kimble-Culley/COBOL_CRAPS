       IDENTIFICATION DIVISION.
       PROGRAM-ID. ROLL-TEST.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 R PIC 9.
       01 L PIC 9.

       LINKAGE SECTION.
       01 DieTotal PIC Z(2).

       PROCEDURE DIVISION USING DieTotal.
       PERFORM DO-ROLL 1 TIMES.
       EXIT.


       DO-ROLL.
           CALL 'ROLL' USING R.
           CALL 'ROLL' USING L.
           ADD R TO L GIVING DieTotal. 

       END PROGRAM ROLL-TEST.
       
