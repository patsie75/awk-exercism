function equilateral(l1, l2, l3) { return ((l1 == l2) && (l2 == l3)) }
function isosceles(l1, l2, l3) { return ((l1 == l2) || (l2 == l3) || (l3 == l1)) }
function scalene(l1, l2, l3) { return ((l1 != l2) && (l2 != l3) && (l2 != l3)) }

{
  if ( ($1 == 0) && ($2 == 0) && ($3 == 0) )
    print "false"
  else if ( ($1 + $2) < $3 || ($2 + $3) < $1 || ($3 + $1) < $2 )
    print "false"
  else
    print @type($1, $2, $3) ? "true" : "false"
}
