function do_verse(num,     i) {
  printf("I know an old lady who swallowed a %s.\n", animal[num])

  if (num>1) {
    print rhyme[num]
    if (num == 8) return
  }

  for (i=num; i>1; i--)
    printf("She swallowed the %s to catch the %s%s\n", animal[i], animal[i-1], (i==3) ? wriggle : ".")

  print rhyme[1]
}

BEGIN {
  nranimals = split("fly spider bird cat dog goat cow horse", animal)

  wriggle = " that wriggled and jiggled and tickled inside her."

  rhyme[1] = "I don't know why she swallowed the fly. Perhaps she'll die."
  rhyme[2] = "It wriggled and jiggled and tickled inside her."
  rhyme[3] = "How absurd to swallow a bird!"
  rhyme[4] = "Imagine that, to swallow a cat!"
  rhyme[5] = "What a hog, to swallow a dog!"
  rhyme[6] = "Just opened her throat and swallowed a goat!"
  rhyme[7] = "I don't know how she swallowed a cow!"
  rhyme[8] = "She's dead, of course!"

  for (i=start; i<=end; i++) {
    if (cnt++ > 0) print ""
    do_verse(i)
  }
}
