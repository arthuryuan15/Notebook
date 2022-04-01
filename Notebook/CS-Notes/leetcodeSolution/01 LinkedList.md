# Leetcode solution - LinkedList
LinkedList is an empty node, or there is a value and pointer  to the next linkedList, so many problems about linkedList can be solved by recursion.

##  1. Intersection of Two Linked Lists

160\. Intersection of Two Linked Lists (Easy)

[Leetcode](https://leetcode.com/problems/intersection-of-two-linked-lists/description/)

For example. the following two linked lists A and B begin to intersect at node c1:

```html
A:          a1 → a2
                    ↘
                      c1 → c2 → c3
                    ↗
B:    b1 → b2 → b3
```

But the following intersect couldn't happen, because every node only has one next pointer, otherwise there is a next pointer, however the following example has two next pinters.

```html
A:          a1 → a2       d1 → d2
                    ↘  ↗
                      c
                    ↗  ↘
B:    b1 → b2 → b3        e1 → e2
```



Require runs in O(n) and only O(1) memory, if it doesn't exsit then return null. 

Let the length of A is a + c, and the length of B is b + c, among the c is the length of the common part of the tail, so we can know that a + c + b = b + c + a.

When the pointer visits LinkedList of A to the tail, then pinters visits LinkedList of B from the beginning, at the same time, when we visit LinkedList of B to the tail, we visit LinkedList of A from the beginning. So we can controll the pointers visit LinkedLists of A and B. In this way, it is possible to control that the pointers accessing the two linkedLists of A and B can access the intersection at the same time.

If there is no intersction, so a + b = b + a,l1 and l2 in  the following code will be null at the same time, thereby exiting the loop.

```java
public ListNode getIntersectionNode(ListNode headA, ListNode headB) {
        // corner case
        if(headA == null || headB == null) return null;
        
        ListNode p1 = headA;
        ListNode p2 = headB;
        
        while(p1 != p2){
            if(p1.next == null && p2.next == null) return null;
            
            if(p1.next != null) p1 = p1.next;
            else p1 = headB;
            
            if(p2.next != null) p2 = p2.next;
            else p2 = headA;
        }   
        return p1;
    }
}
```

##  2. Reverse Linked List

206\. Reverse Linked List (Easy)

[Leetcode](https://leetcode.com/problems/reverse-linked-list/description/) 

head insert

```java
public ListNode reverseList(ListNode head) {
  	if(head == null) return null;
  	ListNode newhead = null;
    while (head != null) {
        ListNode next = head.next;
        head.next = newHead;
      	newHead = head;
        head = next;
    }
    return newHead;
}
```



