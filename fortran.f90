program caesar_cipher
  implicit none
  character(len=100) :: input, encrypted, decrypted
  integer :: shift_amount

  print *, 'Enter text (uppercase or lowercase, no spaces):'
  read *, input
  print *, 'Enter shift amount:'
  read *, shift_amount

  encrypted = encrypt(trim(adjustl(input)), shift_amount)
  print *, 'Encrypted text:', trim(encrypted)

  decrypted = decrypt(encrypted, shift_amount)
  print *, 'Decrypted text:', trim(decrypted)

  call solve(encrypted, 26)

contains

  function encrypt(text, shift_amount) result(out_text)
    character(len=*), intent(in) :: text
    integer, intent(in) :: shift_amount
    character(len=len(text)) :: out_text
    integer :: i, ascii

    out_text = text
    do i = 1, len_trim(text)
      if (text(i:i) >= 'A' .and. text(i:i) <= 'Z') then
        ascii = ichar(text(i:i)) + mod(shift_amount, 26)
        if (ascii > ichar('Z')) ascii = ascii - 26
        out_text(i:i) = char(ascii)
      else if (text(i:i) >= 'a' .and. text(i:i) <= 'z') then
        ascii = ichar(text(i:i)) + mod(shift_amount, 26)
        if (ascii > ichar('z')) ascii = ascii - 26
        out_text(i:i) = char(ascii)
      else
        out_text(i:i) = text(i:i)
      end if
    end do
  end function encrypt

  function decrypt(text, shift_amount) result(out_text)
    character(len=*), intent(in) :: text
    integer, intent(in) :: shift_amount
    character(len=len(text)) :: out_text
    integer :: i, ascii

    out_text = text
    do i = 1, len_trim(text)
      if (text(i:i) >= 'A' .and. text(i:i) <= 'Z') then
        ascii = ichar(text(i:i)) - mod(shift_amount, 26)
        if (ascii < ichar('A')) ascii = ascii + 26
        out_text(i:i) = char(ascii)
      else if (text(i:i) >= 'a' .and. text(i:i) <= 'z') then
        ascii = ichar(text(i:i)) - mod(shift_amount, 26)
        if (ascii < ichar('a')) ascii = ascii + 26
        out_text(i:i) = char(ascii)
      end if
    end do
  end function decrypt

  subroutine solve(text, maxShift)
    character(len=*), intent(in) :: text
    integer, intent(in) :: maxShift
    integer :: s
    character(len=len(text)) :: temp

    do s = 0, maxShift
      temp = decrypt(trim(text), s)
      print *, 'Caesar ', s, ': ', trim(temp)
    end do
  end subroutine solve

end program caesar_cipher
