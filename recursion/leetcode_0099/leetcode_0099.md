# leetcode_0099

- [Recover Binary Search Tree](https://leetcode.com/problems/recover-binary-search-tree/)
- [source code by Ruby](leetcode_0099.rb)

## problem description

Two element of binary tree are swapped by mistake.  
Recover the tree without change the structure.

## analyze code

There are three case of swapped mistake.

1. left-sub-element and root node, left_max > node
2. right-sub-element and root node, right_min < node
3. two sub-element of a root nonode, left_max > node && right_min < node

We should find the max node in left-sub-tree, left_max. And find the min node in right-sub-tree. If any two node meet above three conditions, we should save the couple of node. But we only need to exchange the value of the last couple node.

```ruby
def diagnose(node, rtns)
  left_min, left_max, right_min, right_max = nil, nil, nil, nil
  left_min, left_max = diagnose(node.left, rtns) if (node.left != nil)
  right_min, right_max = diagnose(node.right, rtns) if (node.right != nil)
  if (left_max && left_max.val > node.val && right_min && right_min.val < node.val)
    rtns[0] = left_max
    rtns[1] = right_min
  elsif (left_max == nil || left_max.val < node.val)
    if (right_min && right_min.val < node.val)
      rtns[0] = node
      rtns[1] = right_min
    end
  elsif (right_min == nil || right_min.val > node.val)
    if (left_max && left_max.val > node.val)
      rtns[0] = node
      rtns[1] = left_max
    end
  end

  node_min, node_max = node, node
  [left_min, right_min].each do |min|
    node_min = min if (min && min.val < node_min.val)
  end
  [left_max, right_max].each do |max|
    node_max = max if (max && max.val > node_max.val)
  end
  return node_min, node_max
end
```
