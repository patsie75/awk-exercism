function push(stack, elem) { stack[++stack[0]] = elem }
function pop(stack) { return (stack[0] > 0) ? stack[stack[0]--] : "" }

BEGIN {
  opening["{"] = opening["["] = opening["("]
  closing["}"] = "{"
  closing["]"] = "["
  closing[")"] = "("

  FS = ""
}

{
  for (c=1; c<=NF; c++) {
    # only push valid opening brackets onto stack
    if ($c in opening)
      push(stack, $c)

    # only pop valid closing brackets off stack
    if ($c in closing)
      if (pop(stack) != closing[$c]) {
        print "false"
        exit 0
      }
  }

  if (stack[0] == 0) print "true"
  else print "false"
}
