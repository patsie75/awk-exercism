#!/usr/bin/env gawk -f

BEGIN { FS="[- ]" }
{
  for (i=1; i<=NF; i++) {
    gsub(/[^a-zA-Z0-9]/, "", $i)
    split($i, word, "")
    acronym = acronym toupper(word[1])
  }
  print acronym
}
