{
  # calculate distance (from 0,0)
  d = sqrt($1^2 + $2^2)

  # print score based on distance
  print (d<=10) ? (d<=5) ? (d<=1) ? 10 : 5 : 1 : 0
}
