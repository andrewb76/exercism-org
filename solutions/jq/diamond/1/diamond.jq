

.letter as $l 
| [range(65;91)] | implode | split("") | . as $arr | index($l) as $s
| [range(0;$s+1)] as $r 
  | $r 
  | map(. as $row 
        | $r
        | map(. as $col | if ($s-$col) == $row then $arr[$s-$col] else "." end) | .+(.[:-1] | reverse) | join("")
       ) | . + (.[:-1] | reverse) | .[]
