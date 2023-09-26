//
//  SearchChat.swift
//  huawei
//
//  Created by 王本东 on 2023/6/9.
//

import Foundation


class SearchChat: Any {
    
    //MARK: - 华为OD对称字符串
    //思路：二分法 后半段认为是正序 前半段认为是颠倒了  翻转次数+1  最后计算出翻转次数 %2
    func searchChatAction(_ tuple : (Int ,Int)) -> String
    {
        var maxNum:Double = pow(Double(2.0), Double(tuple.0-1)) //Double 型 不然73709551616 会爆
        var index = Double(tuple.1)
        
//        var reverse = index+1 > maxNum/2 ? true : false //曾经打算判断正反序  结果不行 计算次数才准
        var reverse = 0 //计算 翻转次数 才可以
        while maxNum != 1 {
//            print(index,maxNum)
            if index+1 > maxNum/2{ //后半段
                index = index - maxNum/2
                maxNum = maxNum/2
            }
            else{ // 前半段
                maxNum = maxNum/2
                reverse =  reverse+1
            }
        }
       
        return reverse%2 == 0 ? "red":"blue"
    }
    
    // MARK: - 方法
}
