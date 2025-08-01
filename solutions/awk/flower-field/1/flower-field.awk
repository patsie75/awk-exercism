function isFlower(cell, neighbor) {
  if ( (neighbor < 1) || (neighbor > size) ) return 0;   # above or below screen
  if ( ((cell%width) == 1) && ((neighbor%width) == 0) ) return 0; # left off screen
  if ( ((cell%width) == 0) && ((neighbor%width) == 1) ) return 0; # right off screen

  return (substr(data, neighbor, 1) == FLOWER) ? 1 : 0
}

function countFlowers(cell,     cnt) {
  if (width > 1) {
    cnt  = isFlower(cell, cell-width-1) + isFlower(cell, cell-width) + isFlower(cell, cell-width+1)
    cnt += isFlower(cell, cell-1) + isFlower(cell, cell+1)
    cnt += isFlower(cell, cell+width-1) + isFlower(cell, cell+width) + isFlower(cell, cell+width+1)
  } else {
    cnt = isFlower(cell, cell-width) + isFlower(cell, cell+width)
  }

  return cnt ? cnt : EMPTY
}

function display(data,     y) {
  for (y=0; y<height; y++)
    printf("%s\n", substr(data, y*width+1, width))
}

BEGIN {
  EMPTY = "."
  FLOWER = "*"
}

{
  data = data $0
  height = NR
}

END {
  if (height != 0) {
    size = length(data)
    width = int(length(data) / height)

    for (cell=1; cell<=size; cell++) {
      value = substr(data, cell, 1)

      if (value != FLOWER)
        value = countFlowers(cell)

      newdata = newdata "" value
    }

    display(newdata)
  }
}
