def sumOfPowers:
  tostring | split("") | length as $l | map(pow(tonumber;$l)) | add;

(.number | sumOfPowers) == .number