# "Remove this line and implement your solution" | halt_error
def sq: .*.;

def getScore: . as $d |
if ($d <= 1) then 10
elif ($d <= 5) then 5
elif ($d <= 10) then 1
else 0
end;

. as $point |
$point.x | sq as $k1 |
$point.y | sq as $k2 |
($k1 + $k2) | sqrt as $d |
$d | getScore