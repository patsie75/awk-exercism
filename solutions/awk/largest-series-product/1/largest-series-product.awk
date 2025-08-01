# multiply all digits in a string 
function multiply(str,    value, i) {
  value = 1
  split(str, digit, "")

  for (i in digit) 
    value *= digit[i]

  return value
}

BEGIN { FS = "," }

{
  answer = 0
  val = $1
  len = $2

  l = length(val) - len

  ## satisfy arbitrary tests
  if (len < 0) {
    print "span must not be negative"
    exit 1
  }

  if (l < 0) {
    print "span must be smaller than string length"
    exit 1
  }

  if ( (length(val) == 0) && (len == 0) ) {
    print 1
    exit 0
  }

  if (val != val+0) {
    print "input must only contain digits"
    exit 1
  }
  ## end of arbitrary tests

  # loop over all input digits
  for (i=0; i<=l; i++) {
    # get string value from input and multiply digits
    str = substr(val, i+1, len)
    mul = multiply(str)

    # check against biggest yet answer
    if (mul > answer) 
      answer = mul
  }

  # print the answer
  print answer
}
