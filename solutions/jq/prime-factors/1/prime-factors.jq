def prime_factors:
  if . <= 1 then []
  else
    [., 2, []] | until(.[0] <= 1;
      . as [$n, $d, $f] |
      if $n % $d == 0
      then [($n / $d), $d, ($f + [$d])]
      elif $d == 2
      then [$n, 3, $f]
      elif $d * $d > $n
      then [1, $d, ($f + [$n])]
      else [$n, $d + 2, $f]
      end
    ) | .[2]
  end;

.value | prime_factors