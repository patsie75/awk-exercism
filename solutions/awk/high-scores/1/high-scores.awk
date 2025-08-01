BEGIN {
  PROCINFO["sorted_in"] = "@val_num_desc"
}

($1+0 == $1) {
  score[++nrscores] = $1
}

($1+0 != $1) {
  switch($1) {
    case "list":
      for (i=1; i<=nrscores; i++)
        print score[i]
      break

    case "latest":
      print score[nrscores]
      break

    case "personalBest":
      for (i in score) {
        print score[i]
        break
      }
      break

    case "personalTopThree":
      cnt = 0
      for (i in score) {
        if (cnt++ < 3)
          print score[i]
      }
      break
  }
}
