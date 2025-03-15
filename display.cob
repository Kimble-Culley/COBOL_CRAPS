IDENTIFICATION DIVISION.
PROGRAM-ID. CRAPS-DISPLAY.

DATA DIVISION.

WORKING-STORAGE SECTION.
01 WS-PLAYER-INPUT      PIC Z(1).
01 WS-MESSAGE           PIC X VALUE 'N'. 

LINKAGE SECTION.
01 LK-PASS-BET          PIC Z(5).
01 LK-DONT-PASS-BET     PIC Z(5).
01 LK-COME-BET          PIC Z(5).
01 LK-DONT-COME-BET     PIC Z(5).

SCREEN SECTION.
01 CRAPS-LOGO BACKGROUND-COLOR 2 FOREGROUND-COLOR 7  HIGHLIGHT.
    02 BLANK SCREEN.
    02 LINE 1 COL 8 VALUE "  /$$$$$$  /$$$$$$$   /$$$$$$  /$$$$$$$   /$$$$$$".
    02 LINE 2 COL 8 VALUE " /$$__  $$| $$__  $$ /$$__  $$| $$__  $$ /$$__  $$".
    02 LINE 3 COL 8 VALUE "| $$  \__/| $$  \ $$| $$  \ $$| $$  \ $$| $$  \__/".
    02 LINE 4 COL 8 VALUE "| $$      | $$$$$$$/| $$$$$$$$| $$$$$$$/|  $$$$$$ ".
    02 LINE 5 COL 8 VALUE "| $$      | $$__  $$| $$__  $$| $$____/  \____  $$".
    02 LINE 6 COL 8 VALUE "| $$    $$| $$  \ $$| $$  | $$| $$       /$$  \ $$".
    02 LINE 7 COL 8 VALUE "|  $$$$$$/| $$  | $$| $$  | $$| $$      |  $$$$$$/".
    02 LINE 8 COL 8 VALUE " \______/ |__/  |__/|__/  |__/|__/       \______/".


01 CRAPS-BOARD BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 HIGHLIGHT.
    02 LINE 10 COL 4 VALUE "	  ______________________________________".
    02 LINE 11 COL 4 VALUE "   /  | Don't |   |   |   |   |   |   |   |".
    02 LINE 12 COL 4 VALUE "COME BET: ".
    02 LINE 13 COL 4 VALUE "DON'T COME BET: ".

01 GENERIC-MENU BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 HIGHLIGHT. 
    02 LINE 20 COL 4 VALUE "1. BET PASS".
    02 LINE 21 COL 4 VALUE "2. BET DON'T PASS".
    02 LINE 24 COL 4 VALUE "Press ENTER to Roll the dice".


01 USER-INPUT BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 HIGHLIGHT.
    02 LINE 25 COL 4 VALUE "Your input: ".
    02 LINE 25 COL 16 USING WS-PLAYER-INPUT.

01 PASS-BET BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 HIGHLIGHT.
    02 LINE 20 COL 4 VALUE "How much would you like to bet: ".
    02 LINE 20 COL 36 USING LK-PASS-BET.

01 ROLL-MENU BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 HIGHLIGHT.
    02 LINE 20 COL 4 VALUE " Roll".

PROCEDURE DIVISION USING LK-PASS-BET LK-DONT-PASS-BET LK-COME-BET LK-DONT-COME-BET.

DISPLAY-MAIN-SCREEN.
    DISPLAY CRAPS-LOGO.
    DISPLAY CRAPS-BOARD.

    IF WS-MESSAGE = 'N'
        DISPLAY GENERIC-MENU
    END-IF.

    DISPLAY USER-INPUT.
    ACCEPT USER-INPUT.


    EVALUATE WS-PLAYER-INPUT
        WHEN 1
            MOVE 'X' TO WS-MESSAGE
        WHEN 2
            MOVE 'Y' TO WS-MESSAGE
        WHEN ' '
            MOVE 'Z' TO WS-MESSAGE
        WHEN OTHER
            DISPLAY "Invalid option. Try again."
    END-EVALUATE.


    IF WS-MESSAGE = 'X'
        DISPLAY CRAPS-LOGO
        DISPLAY CRAPS-BOARD
        DISPLAY PASS-BET
        ACCEPT LK-PASS-BET
        MOVE 'N' TO WS-MESSAGE
    END-IF.

    IF WS-MESSAGE = 'Y'
        DISPLAY CRAPS-LOGO
        DISPLAY CRAPS-BOARD
        DISPLAY PASS-BET
        ACCEPT LK-DONT-PASS-BET
        MOVE 'N' TO WS-MESSAGE
    END-IF.

    IF WS-MESSAGE = 'Z'
        DISPLAY CRAPS-LOGO
        DISPLAY CRAPS-BOARD
        DISPLAY ROLL-MENU
        MOVE 'N' TO WS-MESSAGE
    END-IF.

    GO TO DISPLAY-MAIN-SCREEN.
    STOP RUN.
