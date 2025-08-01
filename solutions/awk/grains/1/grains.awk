$1 == "total" {
  for (i=1; i<=64; i++)
    sum += 2 ^ (i-1)
  print sum
  exit 0
}

($1 >= 1) && ($1 <= 64) {
  print 2 ^ ($1 - 1)
  exit 0
}

{
  print "square must be between 1 and 64"
  exit 1
}
