# "Remove this line and implement your solution" | halt_error

.digits as $d |
.span as $s |
($d | length) - $s as $last |
if $s < 0 then 
  "span must not be negative" | halt_error
elif $last < 0 then 
  "span must not exceed string length" | halt_error
elif $d | test("\\D") then
  "digits input must only contain digits" | halt_error
else
  [range(0;$last+1)] | map($d[.:$s+.] | split("") | [.[] | tonumber?] | 
  reduce .[] as $x (1; . * $x)) | max
end