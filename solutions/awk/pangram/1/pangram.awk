BEGIN {
  # define alphabet and reset all letters to unused
  split("abcdefghijklmnopqrstuvwxyz", alphabet, "")

  for (i in alphabet)
    used[alphabet[i]] = 0
}

{
  # read lowercase sentence and split all letters
  n = split(tolower($0), letters, "")

  # mark letters as used
  for (l in letters)
    used[letters[l]] = 1
}

END {
  # check if all letters in the alphabet are used
  for (i in used) {
    if (used[i] != 1) {
      print "false"
      exit 0
    }
  }
  print "true"
  exit 0
}
