function baseconvert(num, src, dst,   i, n, input, sum, d, result) {
  if ((n = split(num, input)) == 0)
    return

  for (i=1; i<=n; i++) {
    if ( (input[i] < 0) || (input[i] >= src) ) {
      print "invalid digit:", input[i]
      exit 1
    }
    sum += input[i] * (src ** (n-i))
  }
  
  while (sum > 0) {
    d = sum % dst
    sum = int(sum/dst)

    result = (result != "") ? (d " " result) : d
  }

  return result ? result : 0

}

BEGIN {
  if ( (ibase < 2) || (obase < 2) ) {
    print "Base conversion must be 2 or higher"
    exit 1
  }
}

{ 
  print baseconvert($0, ibase, obase)
}
