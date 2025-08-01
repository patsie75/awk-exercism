BEGIN {
  color["black"]        = 0
  color["brown"]        = 1
  color["red"]          = 2
  color["orange"]       = 3
  color["yellow"]       = 4
  color["green"]        = 5
  color["blue"]         = 6
  color["violet"]       = 7
  color["grey"]         = 8
  color["white"]        = 9
}

{
  split(tolower($0), resistor)
  if ((resistor[1] in color) && (resistor[2] in color))
    print (resistor[1] == "black") ? color[resistor[2]] : color[resistor[1]] color[resistor[2]]
  else {
    print "invalid color"
    exit 1
  }
}
