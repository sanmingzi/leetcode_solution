# leetcode_0002

- [Add Two Numbers](https://leetcode.com/problems/add-two-numbers/)
- [source code by ruby](leetcode_0002.rb)

## problem desciption

Two linked lists representing two integers. The head of linked list is the lowest digit of the integer

## analyze code

```ruby
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
```
