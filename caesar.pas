program CaesarCipher;

uses crt;

var
  message: string;
  shift: integer;

function EncryptChar(ch: char; shift: integer): char;
var
  charCode: integer;
begin
  charCode := Ord(ch);
  if (charCode >= Ord('A')) and (charCode <= Ord('Z')) then
    charCode := ((charCode - Ord('A') + shift) mod 26) + Ord('A');
  EncryptChar := chr(charCode);
end;

function DecryptChar(ch: char; shift: integer): char;
var
  charCode: integer;
begin
  charCode := Ord(ch);
  if (charCode >= Ord('A')) and (charCode <= Ord('Z')) then
    charCode := ((charCode - Ord('A') - shift + 26) mod 26) + Ord('A');
  DecryptChar := chr(charCode);
end;

function encrypt(text: string; shift: integer): string;
var
  i: integer;
begin
  text := UpCase(text); 
  for i := 1 to Length(text) do
    if text[i] in ['A'..'Z'] then
      text[i] := EncryptChar(text[i], shift);
  encrypt := text;
end;

function decrypt(text: string; shift: integer): string;
var
  i: integer;
begin
  text := UpCase(text);
  for i := 1 to Length(text) do
    if text[i] in ['A'..'Z'] then
      text[i] := DecryptChar(text[i], shift);
  decrypt := text;
end;

procedure solve(text: string; maxShiftValue: integer);
var
  i: integer;
begin
  writeln('Solving (Showing all shifts from ', maxShiftValue, ' to 0):');
  for i := maxShiftValue downto 1 do  
    writeln('Caesar ', i, ': ', decrypt(text, i));
end;

begin
  clrscr; 

  write('Enter a message: ');
  readln(message);
  
  write('Enter shift amount: ');
  readln(shift);

  writeln('Encrypted: ', encrypt(message, shift));
  writeln('Decrypted: ', decrypt(encrypt(message, shift), shift));

  solve(encrypt(message, shift), 26); 
  readkey; 

end.




