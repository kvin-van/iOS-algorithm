//
//  NodeStack.swift
//  NodesAbout
//
//  Created by 王本东 on 2021/3/24.
//

import Foundation

//栈
class NodeStack : Any
{
    var head : Node? = nil //头
    var  size : Int = 0   //大小
    
    //入栈
    func pushStackAction(node : Node?) -> Bool
    {
        if node == nil{
            return false
        }
        
        if head == nil{
            head = node
        }
        else{
            node!.next = head
            head = node
        }
        size+=1
        return true
    }
    
    //出栈
    func popStackAction() -> Bool
    {
        if head == nil{
            return false
        }
        head = head!.next
        size-=1
        return true
    }
    
    // 打印
    func printfStack()
    {
        var temp : Node? = head ?? nil  //Node? 说明temp可空
        while  temp != nil{
            print("栈节点\(temp!.value)")
            temp = temp?.next
        }
    }
    
    //空
    func isEmpty() -> Bool
    {
        if size == 0{
            return true
        }
        return false
    }
    
}
