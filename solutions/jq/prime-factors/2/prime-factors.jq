def prime_factor($d):
  if . == 1 then []
  elif . % $d == 0 then [$d] + (. / $d | prime_factor($d))
  else prime_factor($d + 1) end;

.value | prime_factor(2)