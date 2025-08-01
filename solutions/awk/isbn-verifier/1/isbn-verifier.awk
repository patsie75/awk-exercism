/^[0-9\-]+X?$/ {
  gsub(/[^0-9X]/, "")

  if ( (n=split($0, tokens, "")) == 10 ) {
    for (i=1; i<=n; i++) {
      switch (tokens[i]) {
        case "0":
        case "1":
        case "2":
        case "3":
        case "4":
        case "5":
        case "6":
        case "7":
        case "8":
        case "9":
          value += (tokens[i] * (11-i))
          break

        case "X":
          if (i != 10) {
            print "false"
            exit 0
          } else
            value += (10 * (11-i))
          break

        default:
          print "false"
      }
    }

    if ((value % 11) == 0)
      print "true"
    else
      print "false"

  } else {
    print "false"
  }

  next
}

{
  print "false"
}
