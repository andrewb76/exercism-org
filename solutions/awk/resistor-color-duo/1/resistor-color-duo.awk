BEGIN {
    c["black"] = 0
    c["brown"] = 1
    c["red"] = 2
    c["orange"] = 3
    c["yellow"] = 4
    c["green"] = 5
    c["blue"] = 6
    c["violet"] = 7
    c["grey"] = 8
    c["white"] = 9
}

{
  if (NF>1 && ($1 in c) && ($2 in c)) {        
    result = c[$1] * 10 + c[$2]
    print result
  } else {
    print("invalid color");
    exit 1
  }
}