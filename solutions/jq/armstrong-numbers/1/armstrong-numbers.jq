def sumOfPowers:
  . | tostring | split("") | length as $l | map(tonumber|pow(.;$l)) | add;

(.number | sumOfPowers) == .number