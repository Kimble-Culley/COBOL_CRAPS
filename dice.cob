IDENTIFICATION DIVISION.
PROGRAM-ID. DICE-DISPLAY.

DATA DIVISION.

WORKING-STORAGE SECTION.

LINKAGE SECTION.
01 LK-DieTotal          PIC 9(2).

SCREEN SECTION.
01 TWO-DIE BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 HIGHLIGHT.
    02 LINE 14 COL 38 VALUE "+-------+ +-------+".
    02 LINE 15 COL 38 VALUE "|       | |       |".
    02 LINE 16 COL 38 VALUE "|   *   | |   *   |".
    02 LINE 17 COL 38 VALUE "|       | |       |".
    02 LINE 18 COL 38 VALUE "+-------+ +-------+".

01 THREE-DIE BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 HIGHLIGHT.
    02 LINE 14 COL 38 VALUE "+-------+ +-------+".
    02 LINE 15 COL 38 VALUE "| *     | |       |".
    02 LINE 16 COL 38 VALUE "|       | |   *   |".
    02 LINE 17 COL 38 VALUE "|     * | |       |".
    02 LINE 18 COL 38 VALUE "+-------+ +-------+".

01 FOUR-DIE BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 HIGHLIGHT.
    02 LINE 14 COL 38 VALUE "+-------+ +-------+".
    02 LINE 15 COL 38 VALUE "| *     | | *     |".
    02 LINE 16 COL 38 VALUE "|       | |       |".
    02 LINE 17 COL 38 VALUE "|     * | |     * |".
    02 LINE 18 COL 38 VALUE "+-------+ +-------+".

01 FIVE-DIE BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 HIGHLIGHT.
    02 LINE 14 COL 38 VALUE "+-------+ +-------+".
    02 LINE 15 COL 38 VALUE "| *     | | *     |".
    02 LINE 16 COL 38 VALUE "|   *   | |       |".
    02 LINE 17 COL 38 VALUE "|     * | |     * |".
    02 LINE 18 COL 38 VALUE "+-------+ +-------+".

01 SIX-DIE BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 HIGHLIGHT.
    02 LINE 14 COL 38 VALUE "+-------+ +-------+".
    02 LINE 15 COL 38 VALUE "| *     | | *     |".
    02 LINE 16 COL 38 VALUE "|   *   | |   *   |".
    02 LINE 17 COL 38 VALUE "|     * | |     * |".
    02 LINE 18 COL 38 VALUE "+-------+ +-------+".

01 SEVEN-DIE BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 HIGHLIGHT.
    02 LINE 14 COL 38 VALUE "+-------+ +-------+".
    02 LINE 15 COL 38 VALUE "| *   * | | *     |".
    02 LINE 16 COL 38 VALUE "|       | |   *   |".
    02 LINE 17 COL 38 VALUE "| *   * | |     * |".
    02 LINE 18 COL 38 VALUE "+-------+ +-------+".

01 EIGHT-DIE BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 HIGHLIGHT.
    02 LINE 14 COL 38 VALUE "+-------+ +-------+".
    02 LINE 15 COL 38 VALUE "| *   * | | *   * |".
    02 LINE 16 COL 38 VALUE "|       | |       |".
    02 LINE 17 COL 38 VALUE "| *   * | | *   * |".
    02 LINE 18 COL 38 VALUE "+-------+ +-------+".

01 NINE-DIE BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 HIGHLIGHT.
    02 LINE 14 COL 38 VALUE "+-------+ +-------+".
    02 LINE 15 COL 38 VALUE "| *   * | | *   * |".
    02 LINE 16 COL 38 VALUE "|   *   | |       |".
    02 LINE 17 COL 38 VALUE "| *   * | | *   * |".
    02 LINE 18 COL 38 VALUE "+-------+ +-------+".

01 TEN-DIE BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 HIGHLIGHT.
    02 LINE 14 COL 38 VALUE "+-------+ +-------+".
    02 LINE 15 COL 38 VALUE "| *   * | | *   * |".
    02 LINE 16 COL 38 VALUE "|   *   | |   *   |".
    02 LINE 17 COL 38 VALUE "| *   * | | *   * |".
    02 LINE 18 COL 38 VALUE "+-------+ +-------+".

01 ELEVEN-DIE BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 HIGHLIGHT.
    02 LINE 14 COL 38 VALUE "+-------+ +-------+".
    02 LINE 15 COL 38 VALUE "| *   * | | *   * |".
    02 LINE 16 COL 38 VALUE "| *   * | |   *   |".
    02 LINE 17 COL 38 VALUE "| *   * | | *   * |".
    02 LINE 18 COL 38 VALUE "+-------+ +-------+".

01 TWELVE-DIE BACKGROUND-COLOR 2 FOREGROUND-COLOR 7 HIGHLIGHT.
    02 LINE 14 COL 38 VALUE "+-------+ +-------+".
    02 LINE 15 COL 38 VALUE "| *   * | | *   * |".
    02 LINE 16 COL 38 VALUE "| *   * | | *   * |".
    02 LINE 17 COL 38 VALUE "| *   * | | *   * |".
    02 LINE 18 COL 38 VALUE "+-------+ +-------+".

PROCEDURE DIVISION USING LK-DieTotal.

IF LK-DieTotal = 2
    DISPLAY TWO-DIE
    EXIT
END-IF

IF LK-DieTotal = 3
    DISPLAY THREE-DIE
    EXIT
END-IF

IF LK-DieTotal = 4
    DISPLAY FOUR-DIE
    EXIT
END-IF

IF LK-DieTotal = 5
    DISPLAY FIVE-DIE
    EXIT
END-IF

IF LK-DieTotal = 6
    DISPLAY SIX-DIE
    EXIT
END-IF

IF LK-DieTotal = 7
    DISPLAY SEVEN-DIE
    EXIT
END-IF

IF LK-DieTotal = 8
    DISPLAY EIGHT-DIE
    EXIT
END-IF

IF LK-DieTotal = 9
    DISPLAY NINE-DIE
    EXIT
END-IF

IF LK-DieTotal = 10
    DISPLAY TEN-DIE
    EXIT
END-IF

IF LK-DieTotal = 11
    DISPLAY ELEVEN-DIE
    EXIT
END-IF

IF LK-DieTotal = 12
    DISPLAY TWELVE-DIE
    EXIT
END-IF

EXIT.
