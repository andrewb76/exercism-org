# "Remove this line and implement your solution" | halt_error
.word as $w |
if ($w == "") then 0 
else
[
  ["AEIOULNRST", 1],
  ["DG",	2],
  ["BCMP",	3],
  ["FHVWY",	4],
  ["K",	5],
  ["JX",	8],
  ["QZ",	10]
] | map(. as $gr | $gr[0] | split("") | map({ key: ., value: $gr[1]})  ) | flatten | from_entries as $scoreTbl |
$w | ascii_upcase | split("") | map($scoreTbl[.]) | add
end