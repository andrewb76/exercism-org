# "Remove this line and implement your solution" | halt_error
def fn(ln):
 . as $ser |
 ($ser | length) as $sl |
 if $ser == "" then "series cannot be empty" | halt_error
 elif ln == 0 then "slice length cannot be zero" | halt_error
 elif ln < 0 then "slice length cannot be negative" | halt_error
 elif ln > $sl then "slice length cannot be greater than series length" | halt_error
 elif $sl <= ln then [$ser]
 else [range($sl - ln + 1)] | map($ser[.:.+ln]) end;

.sliceLength as $l | .series | fn($l)