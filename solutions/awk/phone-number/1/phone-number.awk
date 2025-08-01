/[a-zA-Z]/ {
  print "letters not permitted"
  exit 1
}
/[@:!]/ {
  print "punctuations not permitted"
  exit 1
}

{
  gsub(/[^0-9]/, "")

  if (length($0) == 11)
    if (substr($0,1,1) == 1)
      $0 = substr($0,2,10)
    else {
      print "11 digits must start with 1"
      exit 1
    }
}

length($0) < 10 {
  print "must not be fewer than 10 digits"
  exit 1
}

/^[01]/ {
  print "area code cannot start with " ((substr($0,1,1) == "0") ? "zero" : "one")
  exit 1
}

/^...[01]/ {
  print "exchange code cannot start with " ((substr($0,4,1) == "0") ? "zero" : "one")
  exit 1
}

length($0) > 10 {
  print "must not be greater than 11 digits"
  exit 1
}

length($0) == 10
