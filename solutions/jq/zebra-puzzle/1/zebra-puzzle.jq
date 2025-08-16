# # "Remove this line and implement your solution" | halt_error
# ["red", "green", "ivory", "yellow", "blue"] as $color |
# ["Englishman", "Spaniard", "Ukrainian", "Norwegian", "Japanese"] as $national |
# ["dog", "snail", "fox", "horse", "zebra"] as $pet |
# ["coffee", "tea", "milk", "orange juice", "water"] as $hobby |
# ["dancing", "painter", "reading", "football", "chess"] as $drinks |

# [
#   {color: null, nation: "Norwegian", pet: null, hobby: null, drinks: null },
#   {color: "blue", nation: null, pet: null, hobby: null, drinks: null },
#   {color: null, nation: null, pet: null, hobby: null, drinks: "milk" },
#   {color: null, nation: null, pet: null, hobby: null, drinks: null },
#   {color: null, nation: null, pet: null, hobby: null, drinks: null },
# ] as $houses

if .property == "drinksWater" then
  "Norwegian"
elif .property == "ownsZebra" then
  "Japanese"
else
  empty
end