# "Remove this line and implement your solution" | halt_error

def getRoster:
  unique_by(.[0]) | map((.[1] | tostring) + .[0]) | sort | map(.[1:]);

def getGradeList:
  .list as $l | .grade as $g | 
  $l | map(if .[1] < $g then .[0] else empty end) | unique as $filter |
  $l | map(. as $el | if $el[1] == $g and (any($filter[]; test($el[0])) | not) then 
    $el[0] else empty end) | unique;

.property as $pr |
.input as $in |

if $pr == "roster" then $in.students | getRoster
elif $pr == "grade" then { grade: $in.desiredGrade, list: $in.students } | getGradeList
end

