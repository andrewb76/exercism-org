# "Remove this line and implement your solution" | halt_error

def ref:
  [
    { rn: "cats", rs: 128 },
    { rn: "pollen", rs: 64 },
    { rn: "chocolate", rs: 32 },
    { rn: "tomatoes", rs: 16 },
    { rn: "strawberries", rs: 8},
    { rn: "shellfish", rs: 4 },
    { rn: "peanuts", rs: 2 },
    { rn: "eggs", rs: 1 }
  ];

def checkAllergicTo:
  .in as $in |
  .ref as $r |
  $in.score as $s |
  $in.item as $i |
  
  if $s == 0 then 
    debug("F1") | false
  elif $s >= 256 then 
    {in: {score: $s - 256, item: $i}, ref: $r} | checkAllergicTo
  elif $s == $r[0].rs and $i == $r[0].rn then 
    true
  elif ($i == $r[0].rn) | not and ($r | length == 1) then 
    false  
  elif ($i == $r[0].rn) | not and $s == $r[0].rs then 
    false
  elif ($i == $r[0].rn) and ($r | length > 1) then 
    {in: $in, ref: $r[1:2] + $r[:1] + $r[2:]} | checkAllergicTo
  elif $s < $r[0].rs then 
    {in: $in, ref: $r[1:]} | checkAllergicTo
  elif $s > $r[0].rs then 
    {in: {score: $s - $r[0].rs, item: $i}, ref: $r[1:]} | checkAllergicTo
  else
    .
  end;

def allergicList:
  if .score == 0 then
    .resp
  elif (.ref | length) == 0 then 
    .resp
  elif .score >= 256 then 
    {score: .score - 256, ref: .ref, resp: .resp} | allergicList
  elif .score < .ref[0].rs then 
    {score: .score, ref: .ref[1:], resp: .resp} | allergicList  
  elif .score > .ref[0].rs then 
    {score: .score - .ref[0].rs, ref: .ref[1:], resp: .resp + [.ref[0].rn]} | allergicList
  elif .score == .ref[0].rs then 
    .resp + [.ref[0].rn]
  end;


.property as $prop |
.input as $in |

if $prop == "allergicTo" then {in: $in, ref: ref} | checkAllergicTo
elif $prop == "list" then {score: $in.score, ref: ref, resp: []} | allergicList | reverse
else
  .
end