{
  ## add actions to list
  if (and($1,1)) action[actions++] = "wink"
  if (and($1,2)) action[actions++] = "double blink"
  if (and($1,4)) action[actions++] = "close your eyes"
  if (and($1,8)) action[actions++] = "jump"

  if (and($1,16)) {
    # reverse output of actions
    for (i=actions; i>=0; --i)
      str = str ? str "," action[i] : action[i]
  } else {
    # normal output of actions
    for (i=0; i<actions; i++)
      str = str ? str "," action[i] : action[i]
  }

  # print result
  print str
}
