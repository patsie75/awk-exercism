{
  cmd = $1
  h1 = $2
  m1 = $3

  if (cmd == "add")
    m1 += $4

  if (cmd == "subtract")
    m1 -= $4

  if (cmd == "equal") {
      h2 = $4
      m2 = $5
  }

  while (m1<0) { h1--; m1 += 60 }
  while (h1<0) h1 += 24
  total1 = h1*60 + m1
  time1 = sprintf("%02d:%02d", total1/60%24, total1%60)

  while (m2<0) { h2--; m2 += 60 }
  while (h2<0) h2 += 24
  total2 = h2*60 + m2
  time2 = sprintf("%02d:%02d", total2/60%24, total2%60)

  if (cmd == "equal") 
    printf("%s\n", (time1 == time2) ? "true" : "false")
  else
    printf("%s\n", time1)
}
