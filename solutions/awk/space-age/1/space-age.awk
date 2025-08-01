BEGIN {
  age["mercury"]        = 0.2408467 * 31557600
  age["venus"]          = 0.61519726 * 31557600
  age["earth"]          = 1.0000000 * 31557600
  age["mars"]           = 1.8808158 * 31557600
  age["jupiter"]        = 11.862615 * 31557600
  age["saturn"]         = 29.447498 * 31557600
  age["uranus"]         = 84.016846 * 31557600
  age["neptune"]        = 164.79132 * 31557600
}

{
  planet = tolower($1)
  seconds = $2

  if (planet in age)
    printf("%.2f\n", seconds / age[planet])
  else {
    print "not a planet"
    exit 1
  }
}
