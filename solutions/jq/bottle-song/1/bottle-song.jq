def cap:  (.[0:1] | ascii_upcase) + .[1:];
[["no", "s"], ["one", ""], ["two", "s"], ["three", "s"], ["four", "s"], ["five", "s"], ["six", "s"], ["seven", "s"], ["eight", "s"], ["nine", "s"], ["ten", "s"]] as $nums |          
.startBottles as $start |
.takeDown as $steps |
[range($steps)] | map ($start - .) | 
map(. as $n | ["\($nums[$n][0] | cap) green bottle\($nums[$n][1]) hanging on the wall,"] | . + . | . + ["And if one green bottle should accidentally fall,"] + ["There'll be \($nums[$n-1][0]) green bottle\($nums[$n-1][1]) hanging on the wall."] + [""]) | flatten | .[:-1]
