# "Remove this line and implement your solution" | halt_error
.heyBob | trim as $s |
if $s == "" then "Fine. Be that way!"
elif $s == ($s | ascii_upcase) and ($s | split("") | last == "?") and ($s | test("[a-zA-Z]+")) then "Calm down, I know what I'm doing!"
elif $s == ($s | ascii_upcase) and ($s | test("[a-zA-Z]+")) then "Whoa, chill out!"
elif $s | split("") | last == "?" then "Sure."
else "Whatever." end

