program caesar_cipher
  implicit none
  character(len=100) :: input, encrypted, decrypted
  integer :: shift_amount

  print *, 'Enter text (uppercase or lowercase, no spaces):'
  read *, input
  print *, 'Enter shift amount:'
  read *, shift_amount

  encrypted = encrypt(trim(input), shift_amount)
  print *, 'Encrypted text:', trim(encrypted)

  decrypted = decrypt(encrypted, shift_amount)
  print *, 'Decrypted text:', trim(decrypted)

  call solve(trim(input), 26)  ! Start solving from original input

contains

  function encrypt(text, shift_amount) result(out_text)
    character(len=*), intent(in) :: text
    integer, intent(in) :: shift_amount
    character(len=len(text)) :: out_text
    integer :: i, ascii, new_ascii

    out_text = text
    do i = 1, len_trim(text)
      ascii = ichar(text(i:i))
      if (ascii >= ichar('A') .and. ascii <= ichar('Z')) then
        new_ascii = mod(ascii - ichar('A') + shift_amount, 26) + ichar('A')
      else if (ascii >= ichar('a') .and. ascii <= ichar('z')) then
        new_ascii = mod(ascii - ichar('a') + shift_amount, 26) + ichar('a')
      else
        new_ascii = ascii
      end if
      out_text(i:i) = char(new_ascii)
    end do
  end function encrypt

  function decrypt(text, shift_amount) result(out_text)
    character(len=*), intent(in) :: text
    integer, intent(in) :: shift_amount
    character(len=len(text)) :: out_text
    integer :: i, ascii, new_ascii

    out_text = text
    do i = 1, len_trim(text)
      ascii = ichar(text(i:i))
      if (ascii >= ichar('A') .and. ascii <= ichar('Z')) then
        new_ascii = mod(ascii - ichar('A') - shift_amount + 26, 26) + ichar('A')
      else if (ascii >= ichar('a') .and. ascii <= ichar('z')) then
        new_ascii = mod(ascii - ichar('a') - shift_amount + 26, 26) + ichar('a')
      else
        new_ascii = ascii
      end if
      out_text(i:i) = char(new_ascii)
    end do
  end function decrypt

  subroutine solve(original_text, maxShift)
    character(len=*), intent(in) :: original_text
    integer, intent(in) :: maxShift
    integer :: s
    character(len=len(original_text)) :: temp

    do s = maxShift, 0, -1  ! Fix: Ensures Caesar 26 is original text
      temp = encrypt(original_text, s)
      print '(A, I2, A, A)', 'Caesar ', s, ': ', trim(temp)
    end do
  end subroutine solve

end program caesar_cipher




