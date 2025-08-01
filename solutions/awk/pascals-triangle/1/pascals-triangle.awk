function pascalstriangle(rows) {
  if (rows > 0) {
    str = "1"
    print str

    for (i=2; i<=rows; i++) {
      n = split(str, arr)
      str = ""
      for (j=0; j<=n; j++) {
        val = arr[j] + arr[j+1]
        str = str ? (str " " val) : val
      }
      print str
    }
  } else print ""
}

{
  pascalstriangle($1)
}
