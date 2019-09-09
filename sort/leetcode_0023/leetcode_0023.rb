# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  lists.delete(nil) if(lists != nil)
  return nil if(lists == nil || lists.empty?)
  rtn = lists.first
  for i in 1..(lists.length - 1)
      rtn = merge_two_lists(rtn, lists[i])
  end
  return rtn
end

def merge_two_lists(head1, head2)
  head = ListNode.new(nil)
  cur_node = head
  while(head1 != nil && head2 != nil)
      if(head1.val < head2.val)
          cur_node.next = head1
          head1 = head1.next
      else
          cur_node.next = head2
          head2 = head2.next
      end
      cur_node = cur_node.next
  end
  [head1, head2].each { |node| cur_node.next = node if(node != nil) }
  return head.next
end
