# These variables are initialized on the command line (using '-v'):
# - len

length($0) == 0 {
  print "series cannot be empty"
  exit 1
}

(len < 1) || (len > length($0)) {
  print "invalid length"
  exit 1
}

{
  for (start=0; start<=(length($0)-len); start++)
    output = output " " substr($0, start+1, len)

  print substr(output, 2)
}
