       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAESAR-CIPHER.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  INPUT-MSG         PIC X(100).
       01  ENCRYPTED-MSG     PIC X(100).
       01  DECRYPTED-MSG     PIC X(100).
       01  RESULT-MSG        PIC X(100).
       01  SHIFT             PIC 99.
       01  I                 PIC 99 VALUE 1.
       01  CHAR-CODE         PIC 999.
       01  NEW-CODE          PIC 999.
       01  CHAR              PIC X.
       01  MESSAGE-LENGTH    PIC 99.

       PROCEDURE DIVISION.
       MAIN.
           PERFORM MAIN-PROCEDURE.
           STOP RUN.

       MAIN-PROCEDURE.
           DISPLAY "Enter message to encrypt (Any Case Allowed): ".
           ACCEPT INPUT-MSG.
           DISPLAY "Enter shift value (1-25): ".
           ACCEPT SHIFT.

           PERFORM CALCULATE-MESSAGE-LENGTH.
           PERFORM ENCRYPT-PROCESS.
           DISPLAY "Encrypted Message: " ENCRYPTED-MSG.

           PERFORM DECRYPT-PROCESS.
           DISPLAY "Decrypted Message: " DECRYPTED-MSG.

           DISPLAY "Attempting to solve the cipher (Brute Force)...".
           PERFORM SOLVE.

           EXIT.

       CALCULATE-MESSAGE-LENGTH.
           MOVE 1 TO MESSAGE-LENGTH.
           PERFORM UNTIL INPUT-MSG(MESSAGE-LENGTH:1) = SPACE
               ADD 1 TO MESSAGE-LENGTH
           END-PERFORM.
           SUBTRACT 1 FROM MESSAGE-LENGTH.

       ENCRYPT-PROCESS.
           MOVE SPACES TO ENCRYPTED-MSG.
           MOVE 1 TO I.
           PERFORM UNTIL I > MESSAGE-LENGTH
               MOVE INPUT-MSG(I:1) TO CHAR
               IF CHAR >= "A" AND CHAR <= "Z"
                   MOVE FUNCTION ORD(CHAR) TO CHAR-CODE
                   COMPUTE NEW-CODE = CHAR-CODE + SHIFT
                   IF NEW-CODE > 90
                      SUBTRACT 26 FROM NEW-CODE
                   END-IF
                   MOVE FUNCTION CHAR(NEW-CODE) TO ENCRYPTED-MSG(I:1)
               ELSE IF CHAR >= "a" AND CHAR <= "z"
                   MOVE FUNCTION ORD(CHAR) TO CHAR-CODE
                   COMPUTE NEW-CODE = CHAR-CODE + SHIFT
                   IF NEW-CODE > 122
                      SUBTRACT 26 FROM NEW-CODE
                   END-IF
                   MOVE FUNCTION CHAR(NEW-CODE) TO ENCRYPTED-MSG(I:1)
               ELSE
                   MOVE CHAR TO ENCRYPTED-MSG(I:1)
               END-IF
               ADD 1 TO I
           END-PERFORM.

       DECRYPT-PROCESS.
           MOVE SPACES TO DECRYPTED-MSG.
           MOVE 1 TO I.
           PERFORM UNTIL I > MESSAGE-LENGTH
               MOVE ENCRYPTED-MSG(I:1) TO CHAR
               IF CHAR >= "A" AND CHAR <= "Z"
                   MOVE FUNCTION ORD(CHAR) TO CHAR-CODE
                   COMPUTE NEW-CODE = CHAR-CODE - SHIFT
                   IF NEW-CODE < 65
                      ADD 26 TO NEW-CODE
                   END-IF
                   MOVE FUNCTION CHAR(NEW-CODE) TO DECRYPTED-MSG(I:1)
               ELSE IF CHAR >= "a" AND CHAR <= "z"
                   MOVE FUNCTION ORD(CHAR) TO CHAR-CODE
                   COMPUTE NEW-CODE = CHAR-CODE - SHIFT
                   IF NEW-CODE < 97
                      ADD 26 TO NEW-CODE
                   END-IF
                   MOVE FUNCTION CHAR(NEW-CODE) TO DECRYPTED-MSG(I:1)
               ELSE
                   MOVE CHAR TO DECRYPTED-MSG(I:1)
               END-IF
               ADD 1 TO I
           END-PERFORM.
       SOLVE.
           PERFORM VARYING SHIFT FROM 1 BY 1 UNTIL SHIFT > 25
               MOVE SPACES TO RESULT-MSG
               MOVE 1 TO I
               PERFORM UNTIL I > MESSAGE-LENGTH
                   MOVE ENCRYPTED-MSG(I:1) TO CHAR
                   IF CHAR >= "A" AND CHAR <= "Z"
                       MOVE FUNCTION ORD(CHAR) TO CHAR-CODE
                       COMPUTE NEW-CODE = CHAR-CODE - SHIFT
                       IF NEW-CODE < 65
                          ADD 26 TO NEW-CODE
                       END-IF
                       MOVE FUNCTION CHAR(NEW-CODE) TO RESULT-MSG(I:1)
                   ELSE IF CHAR >= "a" AND CHAR <= "z"
                       MOVE FUNCTION ORD(CHAR) TO CHAR-CODE
                       COMPUTE NEW-CODE = CHAR-CODE - SHIFT
                       IF NEW-CODE < 97
                          ADD 26 TO NEW-CODE
                       END-IF
                       MOVE FUNCTION CHAR(NEW-CODE) TO RESULT-MSG(I:1)
                   ELSE
                       MOVE CHAR TO RESULT-MSG(I:1)
                   END-IF
                   ADD 1 TO I
               END-PERFORM
               DISPLAY "Shift " SHIFT ": " RESULT-MSG
           END-PERFORM.

           



           





