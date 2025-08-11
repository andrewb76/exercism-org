. as $in |
"abcdefghijklmnopqrstuvwxyz" | split("") as $al |
"zyxwvutsrqponmlkjihgfedcba" | split("") as $la |

def atbashEncode: ascii_downcase 
  | gsub("[^a-z0-9]"; "") | split("") 
  | map(. as $el | if $al | contains([$el]) then $la[$al | index($el)] else $el end)
  | to_entries
  # | debug
  | reduce .[] as $item ([]; . + [$item.value] + (if ($item.key + 1) % 5 == 0 then [" "] else [""] end))
  | join("") | trim;

def atbashDecode: ascii_downcase 
  | gsub("[^a-z0-9]"; "") | split("")
  | map(. as $el | if $la | contains([$el]) then $al[$la | index($el)] else $el end)
  | join("");


if $in.property == "encode" then $in.input.phrase | atbashEncode
else $in.input.phrase | atbashDecode end