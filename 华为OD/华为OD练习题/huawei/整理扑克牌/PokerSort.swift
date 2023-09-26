//
//  PokerSort.swift
//  huawei
//
//  Created by 王本东 on 2023/6/15.
//

import Foundation


class PokerSort: Any {
    /*思路
     1.建立数字对应的字典并且排序层一个数组。
     2.  >=4的直接放入答案数组里
     3.   建立3的数组 2对子的数组  1单的数组
     4.   ==3的数组因为已经排序好了直接加   ，找最大的对 注意现在3数组里找 。如果最大数字在3数组里 把剩下的放在1数组里面
     5.  ==2的数组 直接 加入
     6. 1数组重新排序后  加入答案数组
     */
    func pokerSort(_ array : Array<Int>) -> Void{
        
        var pokerDic : Dictionary<Int,Int> = [:]
        for x in array{
            if let y = pokerDic[x] {
                pokerDic[x] = y + 1
            }else{
                pokerDic[x] = 1
            }
        }
        let valueArr = pokerDic.sorted { a, b in
            if a.value == b.value{ // 张数一样，点数多的排在前面
                return a.key > b.key
            }
            return a.value > b.value  // 张数多的排在前面
        }
//        print(valueArr)
        var numberArr : Array<Int> = []
        var array3 : Array<Int> = []  //葫芦数组
        var array2 : Array<Int> = [] //对数组
        var array1 : Array<Int> = [] //单数组
            for dic in valueArr {
                if dic.value >= 4{  //炸
                    for _ in 0..<dic.value{
                        numberArr.append(dic.key)
                    }
                }
                if dic.value == 3{ //建立321数组
                    array3.append(dic.key)
                }
                if dic.value == 2{
                    array2.append(dic.key)
                }
                if dic.value == 1{
                    array1.append(dic.key)
                }
            }
        
        while array3.count > 0 { // 葫芦
            let x = array3[0]
            for _ in 0..<3{
                numberArr.append(x)
            }
            array3.remove(at: 0)
            var best = -1 // 葫芦最大值
            for y in array3{
                best = max(best, y)
            }
            for z in array2{
                best = max(best, z)
            }
            if best == -1 { //没有3的同时也没有2了
                
            }
            else if array3.contains(best){
                for (i,value) in array3.enumerated(){
                    if best == value{
                        numberArr.append(value)
                        numberArr.append(value)
                        array1.append(value)
                        array3.remove(at: i)
                    }
                }
            }else {
                for (i ,value) in array2.enumerated(){
                    if best == value {
                        numberArr.append(value)
                        numberArr.append(value)
                        array2.remove(at: i)
                    }
                }
            }
        }
        
        while array2.count > 0 {
            let x = array2[0]
            for _ in 0..<2{
                numberArr.append(x)
            }
            array2.remove(at: 0)
        }
        
        array1 = array1.sorted{a,b in
            return a>b
        }
        
        for x in array1 {
            numberArr.append(x)
        }
        
        print("答案：\(numberArr)")
    }
}
