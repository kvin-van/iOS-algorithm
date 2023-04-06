//
//  ViewController.swift
//  NodesAbout
//
//  Created by 王本东 on 2023/3/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 队列
    let myQueue =  NodeQueue()
        let one : Node = Node()
        one.value = 1
        let two : Node = Node()
        two.value = 2
        let three : Node = Node()
        three.value = 3
        
        myQueue.joinQueue(node: one)
        myQueue.joinQueue(node: two)
        myQueue.joinQueue(node: three)
        myQueue.printfQueue()
        let result = myQueue.outQueue()
        print("移除\(result)")
        let result2 = myQueue.outQueue()
        print("移除\(result2)")
        myQueue.printfQueue()
        
        
        
        //栈
        let four : Node = Node()
        four.value = 4
        let five : Node = Node()
        five.value = 5
        let six : Node = Node()
        six.value = 6
        
        let myStack = NodeStack()
        _ = myStack.pushStackAction(node: four)
        _ = myStack.pushStackAction(node: five)
        _ = myStack.pushStackAction(node: six)
        myStack.printfStack()
        _ = myStack.popStackAction()
        _ = myStack.popStackAction()
        myStack.printfStack()
        _ = myStack.popStackAction()
        myStack.printfStack()
    }


}

