program caesar_cipher
   implicit none
   character(len = 100) :: input, encrypted, decrypted
   integer :: shift

   print *, 'Enter text (uppercase, no spaces):'
   read *, input
   print *, 'Enter shift amount:'
   read *, shift

   encrypted = encrypt(input, shift)
   print *, 'Encrypted text:', encrypted

   decrypted = decrypt(encrypted, shift)
   print *, 'Decrypted text:', decrypted

   call solve(encrypted, 26)

   contains

      function encrypt(text, shift) result(out_text)
         character(len = *), intent(in) :: texta
         integer, intent(in) :: shift
         character(len = len(text)) :: out_text
         integer :: i, ascii

         do i = 1, len(text)
            if (text(i:i) >= 'A' .and. text(i:i) <= 'Z') then
               ascii = ichar(text(i:i)) + mod(shift, 26)
               if (ascii > ichar('Z')) ascii = ascii - 26
               out_text(i:i) = char(ascii)
            else
               out_text(i:i) = text(i:i)
            end if
         end do
      end function encrypt

      function decrypt(text, shift) result(out_text)
         character(len = *), intent(in) :: text
         integer, intent(in) :: shift
         character(len = len(text)) :: out_text
         integer :: i, ascii

         do i = 1, len(text)
            if (text(i:i) >= 'A' .and. text(i:i) <= 'Z') then
               ascii = ichar(text(i:i)) - mod(shift, 26)
               if (ascii < ichar('A')) ascii = ascii + 26
               out_text(i:i) = char(ascii)
            else
               out_text(i:i) = text(i:i)
            end if
         end do
      end function decrypt

      subroutine solve(text, maxshift)
         character(len = *), intent(in) :: text
         integer, intent(in) :: maxshift
         integer :: s
         character(len = len(text)) :: temp

         do s = 0, maxshift
            temp = decrypt(text, s)
            print *, 'Caesar ', s, ': ', temp
         end do
      end subroutine solve

   end program caesar_cipher
