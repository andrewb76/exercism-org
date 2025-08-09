def cap:  (.[0:1] | ascii_upcase) + .[1:];
def nums: ["no", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"][.];     def botEnd: if . == 1 then "" else "s" end;

.startBottles as $start |
.takeDown as $steps |
[range($steps)] | map ($start - .) |
map(. as $n | 
    [
      "\($n | debug | nums | cap) green bottle\($n | botEnd) hanging on the wall,"
    ] 
    | . + . 
    | . + ["And if one green bottle should accidentally fall,"] 
    | . + ["There'll be \($n-1 | nums) green bottle\($n-1 | botEnd) hanging on the wall."] 
    | . + [""]
) | flatten | .[:-1]
