# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def reverse_k_group(head, k)
  return head if(k < 2 || head == nil)
  root = ListNode.new(nil)
  root.next = head
  node = root
  while(can_reverse?(node, k))
      head = node.next
      reverse(node, k)
      node = head
  end
  return root.next
end

def can_reverse?(root, k)
  k.times {
      root = root.next
      return false if(root == nil)
  }
  return true
end

def reverse(root, k)
  # there are (k - 1) node should be move
  for i in 1..(k - 1)
      # the 1th node move (k - 1) times
      count = k - i
      pre_node = root
      cur_node = root.next
      count.times {
          next_node = cur_node.next
          pre_node.next = next_node
          cur_node.next = next_node.next
          next_node.next = cur_node
          pre_node = next_node
      }
  end
end
