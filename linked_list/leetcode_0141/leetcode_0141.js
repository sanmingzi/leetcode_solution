/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} head
 * @return {boolean}
 */
var hasCycle = function(head) {
  if(head == null) {
      return false
  }
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
  return false
};
