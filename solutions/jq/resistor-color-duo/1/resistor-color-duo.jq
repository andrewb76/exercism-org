
.colors[:2] as $colors |
["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"] as $ref |
$colors | map (. as $c | $ref | index($c)) | join("") | tonumber
