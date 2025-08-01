BEGIN {
  FS = ""
  srand()

  n = split("abcdefghijklmnopqrstuvwxyz", alphabet, "")
  for (i=1; i<=n; i++) charset[alphabet[i]] = i-1

  if (key == "") {
    for (i=1; i<=100; i++)
      str = str alphabet[ int(rand() * n) + 1]
    print str
    exit
  }

  if (key ~ /[^a-z]/) {
    print "invalid key"
    exit 1
  }
}

function encdec(type, key,     str, c, k, kchr, newchar) {
  str = ""
  $0 = tolower($0)

  for (c=1; c<=NF; c++) {
    k = k % length(key) + 1
    kchr = substr(key,k,1)

    if (type == "encode")
      newchar = (charset[$c] + charset[kchr]) % n + 1
    else 
      newchar = (charset[$c] - charset[kchr] + n) % n + 1

    str = str alphabet[newchar]
  }

  return str
}


{
  print encdec(type, key)
}
