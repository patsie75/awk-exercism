BEGIN {
  # set field separator(s) to '-', 'T' and ':'
  FS = "[-T:]"

  # define one gigasecond
  gigasecond = "1000000000"
}

{
  # create timestamp from data from stdin (UTC)
  timestamp = mktime($1+0" "$2+0" "$3+0" "$4+0" "$5+0" "$6+0, 1)

  # print new time (UTC)
  print strftime("%FT%T", timestamp + gigasecond, 1)
}
