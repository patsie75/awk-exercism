function isogram(str) {
  n = split(str, arr, "")

  for (i=1; i<=n; i++) {
    if ( (arr[i] ~ /[A-Za-z]/) && (arr[i] in pool) )
      return "false"
    pool[arr[i]]
  }
  return "true"
}


{
  print isogram( tolower($0) )
}
