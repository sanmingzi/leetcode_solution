# leetcode_0141

- [Linked List Cycle](https://leetcode.com/problems/linked-list-cycle/)
- [source code by Javascript](leetcode_0141.js)

## problem desciption

Judge whether the linked list have a cycle.

## analyze code

```js
// use two node, node1/node2, node1 go 1 step each time, but node2 go 2 step
// if the two nodes meet, the linked list have cycle

node1 = head
node2 = head.next
while(node1 != null && node2 != null) {
    if(node1 == node2) {
        return true
    }
    node1 = node1.next
    node2 = node2.next
    if(node2 != null) {
        node2 = node2.next
    }
}
```
