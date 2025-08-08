# "Remove this line and implement your solution" | halt_error
def divBy($num): . % $num == 0;
def notDivBy($nums): . as $n | all($nums[]; $n % . != 0);

.number as $n |
"" |
if $n | divBy(3) then "\(.)Pling" end |
if $n | divBy(5) then "\(.)Plang" end |
if $n | divBy(7) then "\(.)Plong" end |
if $n | notDivBy([3,5,7]) then "\($n)" end
