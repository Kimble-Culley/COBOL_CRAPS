IDENTIFICATION DIVISION.
PROGRAM-ID. MAIN-PROGRAM.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-PASS-BET          PIC 9(5) VALUE 0.
01 WS-DONT-PASS-BET     PIC 9(5) VALUE 0.
01 WS-COME-BET          PIC 9(5) VALUE 0.
01 WS-DONT-COME-BET     PIC 9(5) VALUE 0.



PROCEDURE DIVISION.
    CALL "CRAPS-DISPLAY" USING
        WS-PASS-BET
        WS-DONT-PASS-BET
        WS-COME-BET
        WS-DONT-COME-BET.
    STOP RUN.
