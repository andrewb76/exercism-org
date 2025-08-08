
def build_tree:
    if (.preorder | length) == 0 then 
        {}
    else
        .preorder[0] as $root
        | (.inorder | index($root)) as $idx
        | {
            v: $root,
            l: { preorder: .preorder[1:1+$idx], inorder: .inorder[0:$idx] } | build_tree,
            r: { preorder: .preorder[1+$idx:], inorder: .inorder[$idx+1:] } | build_tree
          }
    end;

debug |
if (.preorder | length) != (.inorder | length) 
  then  "traversals must have the same length" | halt_error
elif ((.preorder | length) != (.preorder | unique | length)) 
  or ((.inorder | length) != (.inorder | unique | length))  
  then  "traversals must contain unique items" | halt_error
elif (.preorder | length) != ((.inorder + .preorder) | unique | length) 
  then  "traversals must have the same elements" | halt_error
else
  build_tree
end