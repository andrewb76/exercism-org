# "Remove this line and implement your solution" | halt_error
def isdev($d): . % $d == 0;
def isnotdev($d): . % $d != 0;

.year as $y |
if $y | isnotdev(4) then false
elif $y | isnotdev(100) then true
elif $y | isnotdev(400) then false
elif $y | isdev(400) then true
end