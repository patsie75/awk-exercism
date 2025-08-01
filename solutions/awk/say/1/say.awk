BEGIN {
  split("ZERO,one,two,three,four,five,six,seven,eight,nine,ten,eleven,twelve,thirteen,fourteen,fifteen,sixteen,seventeen,eighteen,nineteen", singles, ",")
  split("ZERO,TEN,twenty,thirty,forty,fifty,sixty,seventy,eighty,ninety", tens, ",")
  split(",thousand,million,billion,trillion,quadrillion,quintillion,sextillion,septillion", thousands, ",")
}

function hundred(num,   i, s, digit) {
   i = num % 1000
   s = ""

   if ( (i%100) < 20) {
      digit = i%20
      if (digit > 0) s = singles[digit+1]
   } else {
      digit = i%10
      if (digit > 0) s = singles[digit+1]

      digit = int(i/10)%10
      if (digit > 0) {
        if (s != "") s = tens[digit+1] "-" s
        else s = tens[digit+1] "" s
      }
   }

   if (i >= 100) {
      digit = int(i/100)%10
      if (digit > 0) {
#         if (length(s) > 0) s = singles[digit+1] " hundred and " s
         if (length(s) > 0) s = singles[digit+1] " hundred " s
         else s = singles[digit+1] " hundred"
      }
   }

   gsub(/^ *| *$/, "", s)
   return(s)
}

function english_number(num,   s, i, h, thsd, negative) {
   s = ""
   i = int(num)
   thsd = 0
   negative = ""

   if (i < 0) {
      negative = "minus "
      i *= -1
   }

   if (i == 0)
      s = "zero"

   while (i > 0) {
      h = hundred(i)
      if (h) s = hundred(i) " " thousands[thsd+1] " " s
      i = int(i/1000)
      thsd += 1
   }

   s = negative s

   gsub(/^ *| *$/, "", s)
   return(s)
}

{
   for (i=1; i<=NR; i++)
      if (($i >= 0) && ($i <= 999999999999))
         print english_number($i)
      else {
         print "input out of range"
         exit 1
      }
}
