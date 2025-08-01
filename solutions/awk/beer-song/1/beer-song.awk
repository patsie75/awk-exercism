function do_verse(num) {
  if (num > 0) {
    printf("%d bottle%c of beer on the wall, %d bottle%c of beer.\n", num, (num>1)?"s":"", num, (num>1)?"s":"")
    printf("Take %s down and pass it around, %s bottle%c of beer on the wall.\n", (num>1)?"one":"it", (num>1)?(num-1):"no more", (num!=2)?"s":"")
  } else {
    printf("No more bottles of beer on the wall, no more bottles of beer.\n")
    printf("Go to the store and buy some more, 99 bottles of beer on the wall.\n")
  }
}


BEGIN {
  if (verse != "") 
    do_verse(verse)
  else {
    for (i=start; i>=stop; i--)
      do_verse(i)
  }
}