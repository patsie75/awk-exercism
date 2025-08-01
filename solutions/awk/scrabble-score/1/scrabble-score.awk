#!/usr/bin/env gawk -f

BEGIN {
  FS = ""

  n = split("AEIOULNRST", tmp, "")
  for (i=1; i<=n; i++) val[tmp[i]] = 1
  val["D"] = val["G"] = 2
  n = split("BCMP", tmp, "")
  for (i=1; i<=n; i++) val[tmp[i]] = 3
  n = split("FHVWY", tmp, "")
  for (i=1; i<=n; i++) val[tmp[i]] = 4
  val["K"] = 5
  val["J"] = val["X"] = 8
  val["Q"] = val["Z"] = 10
}

{
  for(i=1; i<=NF; i++)
    sum += val[toupper($i)]
  printf("%s,%d\n", toupper($0), sum)
}
