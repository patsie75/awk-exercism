BEGIN { FS="[:,]" }

{
  # lowercase the input data
  $0 = tolower($0)
  val = $1

  # remove any non-alpha characters
  for (i=2; i<=NF; i++) {
    gsub(/[^a-z]/, "", $i)
    if (length($i) > 0)
      value[$i] = val
  }
}

END {
  # gawk "cheat" to have sorted array traversal
  PROCINFO["sorted_in"] = "@ind_str_asc"

  # print result
  for (i in value)
    printf("%c,%d\n", i, value[i])
}
