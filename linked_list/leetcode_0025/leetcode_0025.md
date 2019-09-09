# leetcode_0025

- [Reverse Nodes in k-Group](https://leetcode.com/problems/reverse-nodes-in-k-group/)
- [source code by Ruby](leetcode_0025.rb)

## problem description

Given a linked list, reverse k nodes at a time.

- Example

```
input:
1 -> 2 -> 3 -> 4 -> 5 -> 6
k = 2

output:
2 -> 1 -> 4 -> 3 -> 6 -> 5
```

If the number of nodes is not multiple of k then remain the nodes in the end.

## analyze code

```ruby
# each time, we change the position of current node and next node.
# for 1th node, should move (k - 1) times
# for 2th node, should move (k - 2) times
# ......
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
```
