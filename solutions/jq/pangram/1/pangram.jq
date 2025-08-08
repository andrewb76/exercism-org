# "Remove this line and implement your solution" | halt_error

.sentence | ascii_downcase | split("") | [.[] | select(. | test("[a-z]"))] | unique | length == 26