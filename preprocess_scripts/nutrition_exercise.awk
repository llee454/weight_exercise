# gawk -f nutrition_exercise.awk raw_data/nutrition_exercise.csv > preprocessed_data/nutrition_exercise.csv
BEGIN {
  startYear = 2017
}
/^([^,]*),(.*)/ {
  if (NR > 1) {
    if (match($0, "^([^,]*),(.*)", matches)) {
      ("date '+%j' --date='" matches[1] "'" | getline doy)
      close("date '+%j' --date='" matches[1] "'")
      ("date '+%Y' --date='" matches[1] "'" | getline year)
      close("date '+%Y' --date='" matches[1] "'")

      n = (year - startYear) * 365 + doy

      print n "," doy ",\"" matches[1] "\"," matches[2]
    }
  }
}
