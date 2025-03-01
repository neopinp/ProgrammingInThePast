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

SUB solve (txt AS STRING)
    DIM i AS INTEGER, j AS INTEGER, charCode AS INTEGER
    DIM shiftedText AS STRING
    DIM letter AS STRING
    
    PRINT "Solving (Showing all shifts from 0 to 25):"
    

    FOR i = 25 TO 0 STEP -1 
        shiftedText = "" 
        
        FOR j = 1 TO LEN(txt)
            charCode = ASC(MID(txt, j, 1))
            
            IF charCode >= 65 AND charCode <= 90 THEN
                charCode = ((charCode + 65 + i) MOD 26) + 65 
            END IF
            
            letter = CHR(charCode)
            shiftedText += letter
        NEXT j
        
        PRINT "Caesar "; i; ": "; shiftedText
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

solve(encryptedText)

SLEEP






