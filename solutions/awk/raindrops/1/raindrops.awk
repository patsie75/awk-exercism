#!/usr/bin/env gawk -f

# These variables are initialized on the command line (using '-v'):
# - num

BEGIN {
  if (!(num % 3)) str = str "Pling"
  if (!(num % 5)) str = str "Plang"
  if (!(num % 7)) str = str "Plong"

  print str ? str : num
}
