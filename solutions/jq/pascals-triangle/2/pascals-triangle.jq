def buildTriangle(in):
  . as $size | in as $in | $in | length as $curSize |
  if $curSize == $size then $in
  else $size 
   | buildTriangle($in + ([range($curSize + 1)] | [map(if . == 0 then 0 else $in[$curSize-1][.-1] end + $in[$curSize-1][.]? // 0)]))
  end;

.count as $size |
if $size == 0 then []
else $size | buildTriangle([[1]]) end