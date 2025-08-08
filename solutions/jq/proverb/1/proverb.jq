if (.strings | length) == 0 then 
  []
else
  .strings as $s | ($s | length) as $l |
  [(1 | while(. < $l; . + 1)) as $i | "For want of a " + $s[($i-1):($i)][0] + " the " + $s[($i):($i+1)][0] + " was lost."]
  + ["And all for the want of a " + .strings[0] + "."]
end
