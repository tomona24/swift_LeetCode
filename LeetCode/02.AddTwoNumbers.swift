//
//  02.AddTwoNumbers.swift
//  LeetCode
//
//  Created by Tomona Sako on 2020/08/15.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init() { self.val = 0; self.next = nil; }
//    public init(_ val: Int) { self.val = val; self.next = nil; }
//    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
//}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var nodeArr = [ListNode]()
    nodeArr.append(ListNode(0, nil))
    
    var node1 = l1
    var node2 = l2
    var count = 0
    
    
    while node1 != nil || node2 != nil {
        var sum = nodeArr[count].val
        var digi1 = 0
        var digi2 = 0
        if let val1 = node1?.val {
            sum += val1
            node1 = node1!.next
        }
        if let val2 = node2?.val {
            sum += val2
            node2 = node2!.next
        }
        
        digi1 = sum % 10
        nodeArr[count] = ListNode(digi1)
    
        if sum >= 10 || node1 != nil || node2 != nil {
            digi2 = (sum - digi1) / 10
            nodeArr.append(ListNode(digi2))
        }
            if count > 0 {
            nodeArr[count - 1].next = nodeArr[count]
                }
        count += 1
    }
            
    if nodeArr.count - count == 1  {
        nodeArr[count - 1].next = nodeArr[count]
        }
    
    return nodeArr[0]
}
