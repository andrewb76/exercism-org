# "Remove this line and implement your solution" | halt_error

["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"] as $students |
{G: "grass", C: "clover", R: "radishes", V: "violets"} as $plants |
.student as $student |
($students | index($student)) as $si |
.diagram | split("\n") as [$d1, $d2] | 
[($d1 | split("")), ($d2 | split(""))] as $d |
[$d[0][$si * 2], $d[0][($si * 2) + 1], $d[1][$si * 2], $d[1][($si * 2) + 1]] | flatten | 
map(. as $char | $plants[$char]) | debug

