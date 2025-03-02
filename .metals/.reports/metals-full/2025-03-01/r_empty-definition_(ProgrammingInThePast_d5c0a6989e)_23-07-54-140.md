error id: `<none>`.
file:///C:/Users/neopi/OneDrive/Documents/GitHub/ProgrammingInThePast/caesarcipher.scala
empty definition using pc, found symbol in pc: `<none>`.
empty definition using semanticdb
|empty definition using fallback
non-local guesses:
	 -

Document text:

```scala
object CaesarCipher {
  
  // Function to convert a string to uppercase
  def toUpperCase(txt: String): String = {
    var newTxt = ""
    for (i <- 0 until txt.length) {
      newTxt += txt(i).toUpper
    }
    newTxt
  }

  // Encrypt function (shifts forward)
  def encrypt(txt: String, shift: Int): String = {
    var encrypted = ""
    val text = toUpperCase(txt)
    
    for (i <- 0 until text.length) {
      val charCode = text(i).toInt
      if (charCode >= 65 && charCode <= 90) { // Only shift uppercase letters (A-Z)
        val newChar = ((charCode - 65 + shift) % 26 + 65).toChar
        encrypted += newChar
      } else {
        encrypted += text(i) // Keep non-letter characters unchanged
      }
    }
    encrypted
  }

  // Decrypt function (shifts backward)
  def decrypt(txt: String, shift: Int): String = {
    var decrypted = ""
    val text = toUpperCase(txt)

    for (i <- 0 until text.length) {
      val charCode = text(i).toInt
      if (charCode >= 65 && charCode <= 90) {
        val newChar = ((charCode - 65 - shift + 26) % 26 + 65).toChar
        decrypted += newChar
      } else {
        decrypted += text(i)
      }
    }
    decrypted
  }

  // Solve function (tries all shifts from maxShiftValue down to 0)
  def solve(txt: String, maxShiftValue: Int): Unit = {
    println(s"Solving (Showing all shifts from $maxShiftValue to 0):")
    
    for (i <- maxShiftValue to 0 by -1) {
      println(s"Caesar $i: ${decrypt(txt, i)}")
    }
  }

  // Main method to execute the program
  def main(args: Array[String]): Unit = {
    print("Enter a message: ")
    val message = scala.io.StdIn.readLine()

    print("Enter shift amount: ")
    val shift = scala.io.StdIn.readInt()

    val encryptedText = encrypt(message, shift)
    println(s"Encrypted: $encryptedText")

    val decryptedText = decrypt(encryptedText, shift)
    println(s"Decrypted: $decryptedText")

    solve(encryptedText, 26) // Solve automatically using all shifts
  }
}

```

#### Short summary: 

empty definition using pc, found symbol in pc: `<none>`.