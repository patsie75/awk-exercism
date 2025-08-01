#!/usr/bin/env gawk -f

END {
  printf("One for %s, one for me.\n", $0 ? $0 : "you")
}