# "Remove this line and implement your solution" | halt_error

 # .number | tostring(2) | gsub("0", "") | length 

def tobin:
  [recurse( if . >= 2 then ./2 | floor else empty end ) % 2 | tostring ] 
  | reverse 
  | join("")
  | if . == "" then "0" else . end;

.number | tobin | gsub("0"; "") | length