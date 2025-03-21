IDENTIFICATION DIVISION.
PROGRAM-ID. SCORE-RECORDS.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT SCORE-FILE ASSIGN TO "player.dat"
        ORGANIZATION IS LINE SEQUENTIAL
        ACCESS MODE IS SEQUENTIAL
        FILE STATUS IS FILE-STATUS.

DATA DIVISION.
FILE SECTION.
FD SCORE-FILE.
01 SCORE-RECORD.
   02 SCR-NAME       PIC X(20).
   02 SCR-SALARY     PIC 9(5).

WORKING-STORAGE SECTION.
01 FILE-STATUS      PIC X(2).
01 SCORE-TABLE.
   02 SCORE OCCURS 10 TIMES INDEXED BY SCR-INDEX.
      03 SCR-TBL-NAME       PIC X(20).
      03 SCR-TBL-SALARY     PIC 9(5).

01 NUM-SCORES       PIC 9(2) VALUE 0.
01 I                PIC 9(2).
01 J                PIC 9(2).

LINKAGE SECTION.
01 NEW-NAME        PIC X(20).
01 NEW-SALARY      PIC 9(5).

PROCEDURE DIVISION USING NEW-NAME NEW-SALARY.
MAIN-PROGRAM.

    *> Open the file for reading existing scores
    OPEN INPUT SCORE-FILE.
    IF FILE-STATUS = "00"
        PERFORM READ-SCORES
    ELSE
        DISPLAY "No existing scores or error opening file. Creating new list."
    END-IF.
    CLOSE SCORE-FILE.

    *> Check if the new score qualifies for top 10
    PERFORM CHECK-AND-INSERT.

    *> If there was a change, write back the updated scores
    IF NUM-SCORES > 0 THEN
        OPEN OUTPUT SCORE-FILE
        PERFORM WRITE-SCORES
        CLOSE SCORE-FILE
        DISPLAY "Updated scores saved successfully."
    ELSE
        DISPLAY "No changes were made. New score did not qualify."
    END-IF.

        MOVE 00 TO FILE-STATUS.
        CLOSE SCORE-FILE.
        GOBACK.

READ-SCORES.
    MOVE 0 TO NUM-SCORES.
    MOVE "00" TO FILE-STATUS.

    *> Clear the table
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
        MOVE SPACES TO SCR-TBL-NAME(I)
        MOVE ZEROES TO SCR-TBL-SALARY(I)
    END-PERFORM.

    SET SCR-INDEX TO 1.
    PERFORM UNTIL FILE-STATUS = "10" OR SCR-INDEX > 10
        READ SCORE-FILE INTO SCORE-RECORD
            AT END MOVE "10" TO FILE-STATUS
        END-READ
        IF FILE-STATUS NOT = "10"
            MOVE SCR-NAME TO SCR-TBL-NAME(SCR-INDEX)
            MOVE SCR-SALARY TO SCR-TBL-SALARY(SCR-INDEX)
            ADD 1 TO NUM-SCORES
            SET SCR-INDEX UP BY 1
        END-IF
    END-PERFORM.



CHECK-AND-INSERT.
    *> If there are fewer than 10 scores, just insert it
    IF NUM-SCORES < 10 THEN
        ADD 1 TO NUM-SCORES
    ELSE
        *> If the new score is not greater than the 10th place, ignore it
        IF NEW-SALARY <= SCR-TBL-SALARY(NUM-SCORES) THEN
            DISPLAY "New score is too low, ignoring."
            EXIT PARAGRAPH
        END-IF
    END-IF.

    *> Find where to insert the new score
    SET I TO 1.
    PERFORM UNTIL I > NUM-SCORES OR NEW-SALARY > SCR-TBL-SALARY(I)
        ADD 1 TO I
    END-PERFORM.

    *> Shift lower scores down to make space
    PERFORM VARYING J FROM NUM-SCORES BY -1 UNTIL J < I
        MOVE SCR-TBL-NAME(J - 1) TO SCR-TBL-NAME(J)
        MOVE SCR-TBL-SALARY(J - 1) TO SCR-TBL-SALARY(J)
    END-PERFORM.

    *> Insert the new score in the found position
    MOVE NEW-NAME TO SCR-TBL-NAME(I)
    MOVE NEW-SALARY TO SCR-TBL-SALARY(I).

    *> Ensure we only keep the top 10 scores
    IF NUM-SCORES > 10 THEN
        SUBTRACT 1 FROM NUM-SCORES
    END-IF.

WRITE-SCORES.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > NUM-SCORES
        MOVE SCR-TBL-NAME(I) TO SCR-NAME
        MOVE SCR-TBL-SALARY(I) TO SCR-SALARY
        WRITE SCORE-RECORD
    END-PERFORM.
