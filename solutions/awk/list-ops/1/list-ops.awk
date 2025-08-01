@namespace "listops"

function append(list, item_or_list,     n, i) {
  n = length(list)

  if (awk::typeof(item_or_list) == "array") {
    for (i in item_or_list)
      list[++n] = item_or_list[i]
  } else
    list[n+1] = item_or_list
}

# Concatenate is flattening a list of lists one level
function concat(list, result,     i, j, n) {
  for (j in list) 
    for (i in list[j]) 
      result[++n] = list[j][i]
}


# Only the list elements that pass the given function.
function filter(list, funcname, result,     i, n) {
  for (i in list) 
    if (@funcname(list[i]))
      result[++n] = list[i]
}

# Transform the list elements, using the given function, into a new list.
function map(list, funcname, result,     i, n) {
  for (i in list)
    result[++n] = @funcname(list[i])
}

# Left-fold the list using the function and the initial value.
function foldl(list, funcname, initial,     result, i) {
  result = initial

  for (i in list) 
    result = @funcname(result, list[i])

  return result
}

# Right-fold the list using the function and the initial value.
function foldr (list, funcname, initial,     result, i) {
  result = initial
  reverse(list, rlist)

  for (i in rlist)
    result = @funcname(rlist[i], result)

  return result
}

# the list reversed
function reverse (list, result,     n, i) {
  n = length(list)

  for (i in list)
    result[n-i+1] = list[i]
}
