def isRepited:
  if . | length < 2 then true
  elif .[0] == .[1] then false
  else .[1:] | isRepited
end;

# "Remove this line and implement your solution" | halt_error
.phrase | ascii_downcase | split("") | [.[] | select(. | test("[a-z]"))] | sort | isRepited