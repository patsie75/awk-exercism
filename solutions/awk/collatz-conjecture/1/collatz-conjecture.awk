function collatz(num,     result) {
  result = 0

  while (num > 1) {
    if (num % 2) {
      num = num * 3 + 1
    } else {
      num /= 2
    }
    result++
  }

  return result
}

($1 > 0) {
  print collatz($1)
}

($1 <= 0) {
  print "Error: Only positive numbers are allowed"
  exit 1
}
