No matching declaration found for argument "text"
No matching declaration found for argument "shift"
CHARACTER(LEN=100)


PROGRAM caesarCipher 
  IMPLICIT NONE
  CHARACTER(LEN=26) :: alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" ! comparison string
  CHARACTER(LEN=100) :: message, encrypted, decrypted
  INTEGER :: shift

  PRINT *, "Enter message :"
  READ(*, '(A)') message
  PRINT *, "Enter shift value:"
  READ(*,*) shift
  
  ! Prompt user for input
  PRINT *, "Enter message :"
  READ(*, '(A)') message
  PRINT *, "Enter shift value:"
  READ(*,*) shift

  ! encrypt the message
  encrypted =  ENCRYPT(message, shift)
  PRINT *, "Encrypted message:", TRIM(encrypted)
  !decrypt the message
  decrypted = DECRYPT(encrypted, shift)
  PRINT *, "Decrypted message:", TRIM(decrypted)
  ! trying all shifts 
  PRINT *, "Brute force decryption:"
  CALL SOLVE(encrypted) 




CONTAINS

  ! ENCRYPT FUNCTION - modifies variables passed as args (input text)
  FUNCTION ENCRYPT(text, shift) RESULT(encrypted)
    !
  END FUNCTION ENCRYPT

  ! DECRYPT FUNCTION
  FUNCTION DECRYPT()
    !
  END FUNCTION DECRYPT


  ! SOLVE FUNCTION
  FUNCTION SOLVE()
    !
  END FUNCTION SOLVE

END PROGRAM caesarCipher