BEGIN { FS = "," }
{
  for (i=1; i<=NF; i++)
    if ($i == value) {
       print i
       exit 0
    }

  print "-1"
}
