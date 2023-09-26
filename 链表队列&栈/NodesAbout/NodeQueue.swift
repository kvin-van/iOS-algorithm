//
//  NodeQueue.swift
//  SuanFa
//
//  Created by 王本东 on 2021/3/24.
//

import Foundation

//队列
class NodeQueue : Any
{
    var head : Node? = nil //头
    var tail : Node? = nil   //尾
    var  size : Int = 0   //大小
    
    //入队
    func joinQueue(node : Node)
    {
        if head == nil{
            head = node  //同为首
            tail = node
        }
        else{
//            if head?.next == nil{ //第2次的时候 head == tail 所以注了这段代码
//                head?.next = tail
//            }
            tail?.next = node
            tail = tail?.next
        }
        size+=1
    }
    
    //出队
    func outQueue() -> Any
    {
        if head != nil{
            let ans = head!.value
            head = head?.next
            size-=1
            return ans
        }
        else{
           tail = nil
            return "异常"
        }
    }
    
    // 打印队列
    func printfQueue()
    {
        var temp : Node? = head ?? nil  //Node? 说明temp可空
        while  temp != nil{
            print("队列节点 \(temp!.value)")
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
