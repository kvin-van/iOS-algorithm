//
//  HashErrorCode.swift
//  huawei
//
//  Created by 王本东 on 2023/6/14.
//

import Foundation

/*解题思路
 1、统计各字符出现频次，找到出现频次最高的字符
 2、找到最高频次字符的下标并计算出差值
 3、所有差值中最小的就是最小子数组长度
 */
class HashErrorCode: Any {
    
    func findErrrorCodeLengh(_ array : Array<Int>) -> Int
    {
        var  hashDic : Dictionary<Int,(flag : Int,first : Int,last : Int)> = [:]
        //哈希统计
        for (i , value)  in  array.enumerated(){
//            print(i,value)
            if let x = hashDic[value]{
                hashDic[value] = (x.flag + 1 , x.first , i+1)
            }
            else{
                hashDic[value] = (1 , i+1 , i+1)
            }
        }
//        print(hashDic)
        //寻找出现次数最多的
        var bestArr : Array<(flag : Int,first : Int,last : Int)> = []
        var bestNo = 0
        for key in hashDic.keys{
            let tuple = hashDic[key]!
            if tuple.flag > bestNo {
                bestNo = tuple.flag
                bestArr.removeAll()
                bestArr.append(tuple)
            }else if tuple.flag == bestNo {
                bestArr.append(tuple)
            }
        }
        
        if bestArr.count > 1 { //取最小的段
            var result = Int.max
            for tuple in  bestArr {
                result = min(tuple.last - tuple.first, result)
            }
            return result + 1
        }else{
            let tuple = bestArr[0]
            return tuple.last - tuple.first + 1
        }
    }
    
}
