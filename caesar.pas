program CaesarCipher;

var
  message, encryptedMessage: string;
  shift: integer;

function EncryptChar(ch: char; shift: integer): char;
var
  charCode: integer;
begin
  if (ch >= 'A') and (ch <= 'Z') then
  begin
    charCode := Ord(ch);
    charCode := ((charCode - Ord('A') + shift + 26) mod 26) + Ord('A');
    EncryptChar := Chr(charCode);
  end
  else
    EncryptChar := ch;
end;

function DecryptChar(ch: char; shift: integer): char; 
var
  charCode: integer;
begin
  if (ch >= 'A') and (ch <= 'Z') then
  begin
    charCode := Ord(ch);
    charCode := ((charCode - Ord('A') - shift + 26) mod 26) + Ord('A');
    DecryptChar := Chr(charCode);
  end
  else
    DecryptChar := ch;
end;

function Encrypt(text: string; shift: integer): string;
var
  i: integer;
begin
  text := UpCase(text);
  for i := 1 to Length(text) do
    text[i] := EncryptChar(text[i], shift);
  Encrypt := text;
end;

function Decrypt(text: string; shift: integer): string;
var
  i: integer;
begin
  text := UpCase(text);
  for i := 1 to Length(text) do
    text[i] := DecryptChar(text[i], shift);
  Decrypt := text;
end;

procedure Solve(text: string; maxShiftValue: integer);
var
  i: integer;
begin
  writeln;
  writeln('Solving for all shifts:');
  for i := maxShiftValue downto 0 do
    writeln('Caesar ', i:2, ': ', Encrypt(text, i));
end;

begin
  write('Enter a message: ');
  readln(message);
  
  write('Enter shift amount: ');
  readln(shift);

  message := UpCase(message);
  encryptedMessage := Encrypt(message, shift);

  writeln;
  writeln('Results:');
  writeln('Encrypted: ', encryptedMessage);

  Solve(message, 26);  
end.

