#!/usr/bin/env gawk -f

BEGIN { FS = "" }
{
  for (i=NF; i>0; i--)
    printf("%c", $i)
  printf("\n")
}
