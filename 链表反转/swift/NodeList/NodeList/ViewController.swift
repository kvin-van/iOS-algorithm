//
//  ViewController.swift
//  NodeList
//
//  Created by 王本东 on 2023/5/19.
//

import UIKit

public class ListNode {
    public var val: Int
    public weak var next: ListNode?
    public init(_ val: Int = 0, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

//创建简单链表
func setupList() -> ListNode {
    let one : ListNode = ListNode()
    let two : ListNode = ListNode()
    let three = ListNode();

    one.val = 1;
    one.next = two
    two.val = 2
    two.next = three
    three.val = 3
    three.next = nil
    
    return one
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let head = setupList()
        let new = self.reverseList(head)
        print(new ?? "false")
    }
    
    // 2 空 1 2
    func reverseList ( _ head: ListNode?) -> ListNode? {
           var current  = head
        var newList : ListNode? = nil //不指向空 就回返回 3210
           
           while(current != nil)
           {
               let temp = current?.next
               current?.next = newList
               newList = current!
               current = temp
           }
           return newList
       }
}

