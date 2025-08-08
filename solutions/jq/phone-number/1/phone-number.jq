# "Remove this line and implement your solution" | halt_error
.phrase as $src |
if $src | test("[a-zA-Z]") then "letters not permitted" | halt_error 
elif $src | test("[@:!]") then "punctuations not permitted" | halt_error 
end |

$src | gsub("\\D"; "") as $phoneNum |
if $phoneNum[:1] == "0" then "area code cannot start with zero" | halt_error
elif $phoneNum[3:4] == "0" then "exchange code cannot start with zero" | halt_error
elif $phoneNum[3:4] == "1" then "exchange code cannot start with one" | halt_error
elif ($phoneNum | length) < 10 then "must not be fewer than 10 digits" | halt_error
elif (($phoneNum | length) == 11) and ($phoneNum[1:2] == "0") then "area code cannot start with zero" | halt_error
elif (($phoneNum | length) == 11) and ($phoneNum[1:2] == "1") then "area code cannot start with one" | halt_error
elif (($phoneNum | length) == 11) and ($phoneNum[4:5] == "0") then "exchange code cannot start with zero" | halt_error
elif (($phoneNum | length) == 11) and ($phoneNum[4:5] == "1") then "exchange code cannot start with one" | halt_error
elif (($phoneNum | length) == 11) and ($phoneNum[:1] == "1") then $phoneNum[1:]
elif $phoneNum[:1] == "1" then "area code cannot start with one" | halt_error
elif ($phoneNum | length) > 11 then "must not be greater than 11 digits" | halt_error
elif (($phoneNum | length) == 11) and ($phoneNum[:1] != "1") then "11 digits must start with 1" | halt_error
else $phoneNum end