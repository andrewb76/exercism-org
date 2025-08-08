{"A":0,"C":0,"G":0,"T":0} as $a |
.strand | 
if . == "" then $a
elif test("^[ACGT]*$") then
split("") | reduce .[] as $l ($a; .[$l] += 1) | debug
else
  "Invalid nucleotide in strand" | halt_error
end