# "Remove this line and implement your solution" | halt_error
.legacy | to_entries | 
map((.key | tonumber) as $k | .value | map((.) | ascii_downcase as $v | {key: $v, value: $k}))
| flatten 
| from_entries