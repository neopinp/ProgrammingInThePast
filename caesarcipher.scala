import scala.io.StdIn

object CaesarCipher {
  def main(args: Array[String]): Unit = {
    println("Enter a string:")
    val text = StdIn.readLine().toUpperCase() 
    println("Enter shift value:")
    val shift = StdIn.readInt()

    println("\nResults:")
    println(s"Encrypted: ${encrypt(text, shift)}")
    println("\nSolving for all shifts:")
    solve(text, 26)
  }

  // Encrypt function
  def encrypt(text: String, shift: Int): String = {
    shiftText(text, shift)
  }

  // Decrypt function 
  def decrypt(text: String, shift: Int): String = {
    shiftText(text, -shift)
  }

  // Solving function
  def solve(text: String, maxShift: Int): Unit = {
    for (shift <- maxShift to 0 by -1) {
      println(f"Caesar $shift%2d: ${encrypt(text, shift)}")
    }
  }


  def shiftText(text: String, shift: Int): String = {
    val result = new StringBuilder()
    for (char <- text) {
      if (char.isLetter) {
        val base = if (char.isUpper) 'A' else 'a'
        result.append(((char - base + shift + 26) % 26 + base).toChar)
      } else {
        result.append(char)
      }
    }
    result.toString()
  }
}


