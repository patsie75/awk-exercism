@load "ordchr"

BEGIN { FS = "" }

{
  for (c=1; c<=NF; c++) {
    ascii = ord($c)

    # lowercase a-z
    if ((ascii >= 65) && (ascii <= 90)) {
      ascii += distance
      if (ascii > 90) ascii -= 26
    }

    # uppercase A-Z
    if ((ascii >= 97) && (ascii <= 122)) {
      ascii += distance
      if (ascii > 122) ascii -= 26
    }

    result = result chr(ascii)
  }

  print result
}
