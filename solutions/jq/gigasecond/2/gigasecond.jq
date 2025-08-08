def fixIn:
  if . | length == 10 then . + "T00:00:00Z"
  elif . | length == 19 then . + "Z" end;

.moment | fixIn | fromdateiso8601 + 1e9 | strftime("%Y-%m-%dT%H:%M:%S")