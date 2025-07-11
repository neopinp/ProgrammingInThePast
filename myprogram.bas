' FreeBASIC Caesar Cipher - Project One
DIM message AS STRING
DIM shift AS INTEGER

FUNCTION toUpperCase (txt AS STRING) AS STRING
    DIM i AS INTEGER
    DIM newTxt AS STRING
    FOR i = 1 TO LEN(txt)
        newTxt += UCASE(MID(txt, i, 1))
    NEXT i
    RETURN newTxt
END FUNCTION

FUNCTION encrypt (txt AS STRING, shift AS INTEGER) AS STRING
    DIM i AS INTEGER, charCode AS INTEGER
    DIM encrypted AS STRING
    txt = toUpperCase(txt) 
    
    FOR i = 1 TO LEN(txt)
        charCode = ASC(MID(txt, i, 1))
        
        IF charCode >= 65 AND charCode <= 90 THEN
            charCode = ((charCode - 65 + shift) MOD 26) + 65
        END IF
        
        encrypted += CHR(charCode)
    NEXT i
    RETURN encrypted
END FUNCTION

FUNCTION decrypt (txt AS STRING, shift AS INTEGER) AS STRING
    DIM i AS INTEGER, charCode AS INTEGER
    DIM decrypted AS STRING
    txt = toUpperCase(txt)
    
    FOR i = 1 TO LEN(txt)
        charCode = ASC(MID(txt, i, 1))
        
        IF charCode >= 65 AND charCode <= 90 THEN
            charCode = ((charCode - 65 - shift + 26) MOD 26) + 65
        END IF
        
        decrypted += CHR(charCode)
    NEXT i
    RETURN decrypted
END FUNCTION

SUB solve (txt AS STRING, shiftValue AS INTEGER)
    DIM i AS INTEGER
    PRINT "Solving (Showing all shifts from "; shiftValue; " to 0):"
    
    FOR i = shiftValue TO 0 STEP -1
        PRINT "Caesar "; i; ": "; decrypt(txt, i)  ' 
    NEXT i
END SUB

DIM encryptedText AS STRING
DIM decryptedText AS STRING

PRINT "Enter a message: ";
INPUT message
PRINT "Enter shift amount: ";
INPUT shift

encryptedText = encrypt(message, shift)
PRINT "Encrypted: "; encryptedText

decryptedText = decrypt(encryptedText, shift)
PRINT "Decrypted: "; decryptedText

solve(encryptedText, 25)

SLEEP


