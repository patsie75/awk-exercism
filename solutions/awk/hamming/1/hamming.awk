#!/usr/bin/env gawk -f

NR == 1 { len1 = split($0, dna1, "") }
NR == 2 {
  len2 = split($0, dna2, "")
  if (len1 != len2) {
    printf("strands must be of equal length")
    exit 1
  }

  cnt = 0
  for (i=1; i<=len1; i++)
    cnt += (dna1[i] != dna2[i])
  print cnt
}
