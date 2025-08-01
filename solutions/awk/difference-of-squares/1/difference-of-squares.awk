function sum_of_squares(num,     i, result) {
  for (i=1; i<=num; i++)
    result += (i ** 2)
  return result
}

function square_of_sum(num,    i, result) {
  for (i=1; i<=num; i++)
    result += i
  return (result ** 2)
}

function difference(num) {
  return square_of_sum(num) - sum_of_squares(num)
}

BEGIN { FS="," }

{
  fnc = $1
  print @fnc($2)
}
