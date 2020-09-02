//
//  ８３。RemoveDuplicatesfromSortedList.swift
//  LeetCode
//
//  Created by Tomona Sako on 2020/08/14.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if let first = head {
            var q = [ListNode?]()
            q.append(first)
            
            var nextQ = [ListNode]()
            
            while !q.isEmpty {
                let node = q.removeFirst()!
                if node.next != nil {
                    nextQ.append(node.next!)
                
                    while !nextQ.isEmpty {
                        let next = nextQ.removeFirst()
                        if node.val == next.val {
                            if next.next != nil {
                                node.next = next.next
                                nextQ.append(node.next!)
                                continue
                            } else {
                                node.next = nil
                            }
                        }
                    }
                }
                if node.next != nil {
                    q.append(node.next)
                }
            }
            return first
        }
        return nil
    }
    
}

