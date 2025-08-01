function count(n,    cnt) {
  cnt = 0
  while (n > 0) {
    cnt += (n%2)
    n = int(n/2)
  }
  return cnt
}


{
  print count($1)
}
