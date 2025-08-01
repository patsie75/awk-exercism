# These variables are initialized on the command line (using '-v'):
# - action
# - grade

BEGIN {
  FS = ","
  PROCINFO["sorted_in"] = "@ind_str_asc"
}

{
  if ($1 in assigned)
    next

  roster[$2][$1]
  assigned[$1]
}

END {
  if (action == "roster") {
    for (grade in roster)
      for (name in roster[grade])
        str = str ? str "," name : name
  }
  if (action == "grade") {
    for (name in roster[grade])
      str = str ? str "," name : name
  }

  print str
}
