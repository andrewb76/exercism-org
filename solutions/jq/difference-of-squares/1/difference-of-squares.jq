# "Remove this line and implement your solution" | halt_error
def square: . * .;
def squareSum: add | square;
def sumSquare: map(. | square) | add;

.property as $pr |
.input.number as $t |
[range(1;$t+1)] as $r |
$r | debug |
if ($pr == "squareOfSum") then $r | squareSum
elif ($pr == "sumOfSquares") then $r | sumSquare
elif ($pr == "differenceOfSquares") then ($r | squareSum) - ($r | sumSquare)
end