# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  l_rtn = ListNode.new(nil)
  cur_node = l_rtn
  add_num = 0
  
  while true
      v1 = v2 = 0
      v1 = l1.val if l1 != nil
      v2 = l2.val if l2 != nil
      value = v1 + v2 + add_num
      cur_node.val = value % 10
      add_num = value / 10
      l1 = (l1 == nil) ? nil : l1.next
      l2 = (l2 == nil) ? nil : l2.next
      
      if l1 == nil && l2 == nil && add_num == 0
          break
      else    
          cur_node.next = ListNode.new(0)
          cur_node = cur_node.next
      end
  end
  
  l_rtn
end
