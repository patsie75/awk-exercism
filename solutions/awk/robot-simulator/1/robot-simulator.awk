BEGIN {
  ndirection[0] = "north"
  ndirection[1] = "east"
  ndirection[2] = "south"
  ndirection[3] = "west"

  sdirection["north"] = 0
  sdirection["east"]  = 1
  sdirection["south"] = 2
  sdirection["west"]  = 3
    
  dir = dir ? dir : "north"
  
  if (dir in sdirection)
    d = sdirection[dir]
  else {
    print "invalid direction"
    fail=1
    exit 1
  }
}

{
  for (i=1; i<=NF; i++) {

    switch ($i) {
      case "L":
        if (--d < 0) d += 4
        break

      case "R":
        if (++d > 3) d -= 4
        break
    
      case "A":
        switch (d) {
          case 0: y++; break
          case 1: x++; break
          case 2: y--; break
          case 3: x--; break
        }
        break

      default:
        print "invalid instruction"
        fail=1
        exit 1
    }
  }
}

END {
  if (!fail)
    printf("%d %d %s\n", x, y, ndirection[d])
} 
