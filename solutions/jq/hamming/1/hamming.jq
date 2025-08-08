.strand1 as $s1 |
.strand2 as $s2 |
($s1 | length) as $l1 |
($s2 | length) as $l2 |
if $l1 != $l2 then 
    "strands must be of equal length" | halt_error(1)
else
    reduce range(0; $l1) as $index (0;
        . + (if $s1[$index:$index+1] == $s2[$index:$index+1] then 0 else 1 end)
    )
end
