# leetcode_0023

- [Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/)
- [source code by Ruby](leetcode_0023.rb)

## problem description

Merge k sorted lists to one sorted list.

## analyze code

```ruby
# merge two lists each time
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
```

This solution run in a long time. Maybe, there has another better solutions.
