# The input will be null or an object that _may_ contain keys
#   actual_minutes_in_oven,
#   number_of_layers
#
# If the needed key is missing, use a default value:
#   zero minutes in oven,
#   one layer.
#
# Task: output a JSON object with keys:
40 as $expected_minutes_in_oven |
2 as $prepare_each_layer |
{
  $expected_minutes_in_oven,
  remaining_minutes_in_oven: ($expected_minutes_in_oven - (.actual_minutes_in_oven // 0)),
  preparation_time: ($prepare_each_layer * (.number_of_layers // 1)),
  total_time: (($prepare_each_layer * (.number_of_layers // 1)) + (.actual_minutes_in_oven // 0))
}
