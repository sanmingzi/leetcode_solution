# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Void} Do not return anything, modify root in-place instead.
def recover_tree(root)
  rtns = Array.new(2)
  diagnose(root, rtns)
  exchange(rtns.first, rtns.last)
  return root
end

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

def exchange(node1, node2)
  node1.val, node2.val = node2.val, node1.val
end
