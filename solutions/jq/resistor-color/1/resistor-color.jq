.input.color as $color |
["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"] as $ref | 
 if ($color | type) != "string" then $ref
 else $ref | to_entries[] | select(.value == $color) | .key end