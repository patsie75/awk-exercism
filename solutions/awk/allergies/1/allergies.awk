#!/usr/bin/env gawk -f

BEGIN {
  FS = ","

  allergies1["eggs"] = 1
  allergies1["peanuts"] = 2
  allergies1["shellfish"] = 4
  allergies1["strawberries"] = 8
  allergies1["tomatoes"] = 16
  allergies1["chocolate"] = 32
  allergies1["pollen"] = 64
  allergies1["cats"] = 128

  allergies2[1]   = "eggs"
  allergies2[2]   = "peanuts"
  allergies2[4]   = "shellfish"
  allergies2[8]   = "strawberries"
  allergies2[16]  = "tomatoes"
  allergies2[32]  = "chocolate"
  allergies2[64]  = "pollen"
  allergies2[128] = "cats"
}

(NF == 2) && ($2 == "list") {
  bit = 1
  value = $1

  while (value) {
    if ((value%2) && (bit in allergies2))
      list = list "," allergies2[bit]
    value = int(value/2)
    bit *= 2
  }
  print substr(list, 2)
}

(NF == 3) && ($2 == "allergic_to") {
  value = $1
  allergy = $3

  if (allergy in allergies1)
    print ( int(value / allergies1[allergy]) % 2) ? "true" : "false"
  else
    print "false"
}
