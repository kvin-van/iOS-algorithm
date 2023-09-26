//
//  AboutPort.swift
//  huawei
//
//  Created by 王本东 on 2023/6/13.
//

import Foundation


class AboutPort: Any {
    
    //思路：先去重，然后冒泡 ，前一个吞并后一个数组 删除后  重新冒泡
    func aboutPort(_ m : Int,_ array : Array<Array<Int>>) -> String
    {
        if m>10{
            return "\(array)"
        }

        var tempArr = Array(array) // 可变数组

        var index = 0 // 为了循环到一半可以重新开始循环 for循环做不到
        while index < tempArr.count-1
        {
            var  tmpArr =  tempArr[index]
            tmpArr = Array(Set(tmpArr).sorted()) //Set 默认是无序的
            tempArr[index] = tmpArr // 赋值
            
            for j in index+1..<tempArr.count{ //冒泡 都保证循环到
                var  tmpArr2 =  tempArr[j]
                if tmpArr2.count < 2{  //无需合并
                    continue;  //continue 关键字不能用在while 循环
                }
                tmpArr2 = Array(Set(tmpArr2).sorted())
                tempArr[j] = tmpArr2
                
                let flagSet = Set(tmpArr).intersection(Set(tmpArr2)) // 交集
                if flagSet.count>=2{ // 可以合并
                    tempArr[index] = Array(Set(tmpArr).union(Set(tmpArr2))).sorted()//并集
                    tempArr.remove(at: j) //删除后一个
                    index = 0
                    break;
                }
            }
            index = index+1
        }
        
        return "\(tempArr)"
    }
    
}
