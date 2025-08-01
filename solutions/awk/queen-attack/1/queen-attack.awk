function abs(i) { return (i<0) ? -i : i }
{
  # check silly arbitrary input 
  if (($1 == $3) && ($2 == $4)) {
    print "invalid"
    exit 1
  }
  
  for (i=1; i<=4; i++) { 
    if ( ($i < 0) || ($i > 7) ) {
      print "invalid"
      exit 1
    }
  }

  # check vertical and horizontal, then diagonal
  if ( ($1 == $3) || ($2 == $4) || \
       (abs($1 - $3) == abs($2 - $4)) ) print "true"
  else print "false"
}
