/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var detectCycle = function(head) {
  if(head == null) {
      return head
  }
  node = cycleNode(head)
  if(node == null) {
      return null
  }
  cycleNodes = allCycleNode(node)
  while(true) {
      if(cycleNodes.includes(head)) {
          return head
      }
      head = head.next
  }
};

var cycleNode = function(head) {
  node1 = head
  node2 = head.next
  while(node1 != null && node2 != null) {
      if(node1 == node2) {
          return node1
      }
      node1 = node1.next
      node2 = node2.next
      if(node2 != null) {
          node2 = node2.next
      }
  }
  return null
}

var allCycleNode = function(node) {
  flag = node
  nodes = [node]
  node = node.next
  while(node != flag) {
      nodes.push(node)
      node = node.next
  }
  return nodes
}
