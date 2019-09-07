/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} headA
 * @param {ListNode} headB
 * @return {ListNode}
 */
var getIntersectionNode = function(headA, headB) {
  lengthA = getListLength(headA)
  lengthB = getListLength(headB)
  if(lengthA > lengthB) {
      headA = getNode(headA, lengthA - lengthB)
  } else if(lengthB > lengthA) {
      headB = getNode(headB, lengthB - lengthA)
  }
  while(headA != null && headB != null) {
      if(headA == headB) {
          return headA
      }
      headA = headA.next
      headB = headB.next
  }
  return null
};

var getListLength = function(head) {
  length = 0
  while(head) {
      length += 1
      head = head.next
  }
  return length
}

var getNode = function(head, count) {
  while(count > 0) {
      count--
      head = head.next
  }
  return head
}