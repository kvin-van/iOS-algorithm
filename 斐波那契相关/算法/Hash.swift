//
//  Hash.swift
//  算法
//
//  Created by 王本东 on 2023/5/8.
//

import Foundation

@objcMembers public  class HashObject : NSObject
{
    
     @objc var dic : Dictionary <Int , Int> = [:]
    
      @objc func twoSum ( _ numbers: [Int],  _ target: Int) -> [Int] {
           for index in numbers{
               if dic[target - index] != nil{
                   let first :Int = dic[target - index]!
                   let end : Int = numbers.firstIndex(where: {$0 == index}) ??  0
                   return [first ,end]
               }
               else{
                   dic[index] = numbers.firstIndex(where: {$0 == index})
               }
           }
           print("空")
           return []
       }
    
    @objc func twoSum2(_ intArr : [Int] , _ target : Int) -> [Int]
    {
        var dic : Dictionary <Int,Int> = [:]
        for i in 0..<intArr.count{
            let value = intArr[i]
            let x = target - value
            if dic[x] != nil{
                return [dic[x]!,i]
            }else{
                dic[value] = i
            }
        }
        return []
    }
}
