# leetcode_0142

- [Linked List Cycle II](https://leetcode.com/problems/linked-list-cycle-ii/)
- [source code by Javascript](leetcode_0142.js)

## problem description

This problem is similar than leetcode_0141.  
It require to find the first node in the cycle of linked list.

## analyze code

1. find one node in the cycle of linked list
2. use the node found in step1, find all nodes in the cycle
3. travle the linked list from head, until find the node in cycle
