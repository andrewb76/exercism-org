def getNums:
  .rez as $rez |
  .rest as $rest |
  if $rest | length == 0 then
    []  
  elif $rest | length == 1 then
    $rez + $rest[:1]
  else
    {rez: $rez + $rest[:1], rest: $rest[1:] | map(select((. % $rest[:1][0] == 0) | not))} | getNums
  end;

.limit as $end | {rez: [], rest: [range(2; $end+1)]} | getNums