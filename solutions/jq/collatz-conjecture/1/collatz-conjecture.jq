def _steps($n; $count):
  if $n <= 0 then "Only positive integers are allowed" | halt_error
  elif $n == 1 then $count
  elif $n % 2 == 0 then _steps($n / 2; $count + 1)
  else _steps(($n * 3) + 1; $count + 1)
  end;

def steps: . as $n | _steps($n; 0);
