def toRna:
  {
    "": "",
    "C": "G",
    "G": "C",
    "T": "A",
    "A": "U"
  } as $dic |
  split("") |
  map($dic[.]) |
  join("")
;