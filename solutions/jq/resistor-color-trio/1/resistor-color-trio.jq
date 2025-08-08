def withUnit:
  if . > 1000000000 then { value: (. / 1000000000), unit: "gigaohms" }
  elif . > 1000000 then { value: (. / 1000000), unit: "megaohms" }
  elif . > 1000 then { value: (. / 1000), unit: "kiloohms" }
  else { value: ., unit: "ohms" }
  end;

["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"] as $ref
| .colors as $colors
| ($colors[0:2] | map(. as $c | $ref | index($c)) | join("") | tonumber) as $digits
| ($ref | index($colors[2])) as $exp
| $digits * (1 | reduce range(0; $exp) as $_ (.; . * 10)) | withUnit