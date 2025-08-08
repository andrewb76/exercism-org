def sortArr: ascii_downcase | split("") | sort;

(.subject | ascii_downcase) as $sd |
(.subject | sortArr) as $s |
.candidates as $c |


$c | map(if (. | sortArr) == $s and (. | ascii_downcase == $sd | not ) then . else empty end)