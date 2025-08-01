#!/usr/bin/env gawk -f

{
  value = $1
  while (value >= 1000) { printf("M"); value -= 1000 }
  while (value >= 900) { printf("CM"); value -= 900 }
  while (value >= 500) { printf("D"); value -= 500 }
  while (value >= 400) { printf("CD"); value -= 400 }
  while (value >= 100) { printf("C"); value -= 100 }
  while (value >= 90) { printf("XC"); value -= 90 }
  while (value >= 50) { printf("L"); value -= 50 }
  while (value >= 40) { printf("XL"); value -= 40 }
  while (value >= 10) { printf("X"); value -= 10 }
  while (value >= 9) { printf("IX"); value -= 9 }
  while (value >= 5) { printf("V"); value -= 5 }
  while (value >= 4) { printf("IV"); value -= 4 }
  while (value >= 1) { printf("I"); value -= 1 }
  printf("\n")
}

