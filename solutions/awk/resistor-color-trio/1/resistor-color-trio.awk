BEGIN {
  value["black"] = 0
  value["brown"] = 1
  value["red"] = 2
  value["orange"] = 3
  value["yellow"] = 4
  value["green"] = 5
  value["blue"] = 6
  value["violet"] = 7
  value["grey"] = 8
  value["white"] = 9

  metric[0] = "ohms"
  metric[1] = "kiloohms"
  metric[2] = "megaohms"
  metric[3] = "gigaohms"
}

{
  if ( !($1 in value) || !($2 in value) || !($3 in value) ) {
    print "Illegal input"
    exit 1
  }

  result = (value[$1] value[$2]) * 10**value[$3]

  i = 0
  while (result ~ /000$/) {
    result /= 1000
    i++
  }

  printf("%s %s\n", result, metric[i])
}
