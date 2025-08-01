function caps(str) {
  return toupper(substr(str,1,1)) substr(str,2)
}

function do_verse(num) {
  printf("%s green bottle%c hanging on the wall,\n", caps(digit[num]), (num>1)?"s":"")
  printf("%s green bottle%c hanging on the wall,\n", caps(digit[num]), (num>1)?"s":"")
  printf("And if one green bottle should accidentally fall,\n")
  printf("There'll be %s green bottle%c hanging on the wall.\n", digit[num-1] , ((num-1)!=1)?"s":"")
}


BEGIN {
  n = split("one two three four five six seven eight nine ten", digit)
  digit[0] = "no"

  for (i=startBottles; i>(startBottles-takeDown); i--) {
    do_verse(i)
    if (i != (startBottles-takeDown) ) 
      printf("\n")
  }
}
