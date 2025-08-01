BEGIN {
  # check if valid number
  if (num+0 != num) {
    print "false"
    exit 0
  }

  # split number into digits and sum their powers
  digits = split(num, digit, "")
  for (i=1; i<=digits; i++)
    sum += digit[i] ^ digits

  # check if the sum equals to the number
  if (sum == num)
    print "true"
  else 
    print "false"
}
