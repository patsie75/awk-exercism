function strip(str) { return gensub(/^\s*|\s*$/, "", "g", str) }
function nonblank(str) { return gensub(/\s/, "", "g", str) }

BEGIN { 
  RS = "[.?!][[:space:]]+"

  print "The text is:"
}

{
  s = strip($0 RT)

  if (sents < 3) 
    print substr(s, 1, 50) ((length(s) > 50) ? "..." : "")

  if (sents == 3)
    print "..."

  if (s != "") {
    sents++
    n = split(s, tmp)
    words += split(s, tmp)
    chars += length(nonblank(s))
  }
}

END {
  score = (4.71 * chars / words + 0.5 * words / sents - 21.43)

  printf("\nWords: %d\nSentences: %d\nCharacters: %d\n", words, sents, chars)
  printf("Score: %.2f\n", score)

  if (score < 14) 
    printf("This text should be understood by %d-%d year-olds.\n", int(score+0.5)+4, int(score+0.5)+5)
  else
    printf("This text should be understood by 18-22 year-olds.\n")
}
