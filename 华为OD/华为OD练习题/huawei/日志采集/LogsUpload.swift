//
//  LogsUpload.swift
//  huawei
//
//  Created by 王本东 on 2023/6/13.
//

import Foundation


class LogsUpload: Any {
    //思路 array 每一数值 都是一次上传机会  如果不够100 可以选择不上传 超过100 必须上传了。 计算每次的最大的得分 取最大值 返回
    func logUpload(_ array : Array<Int>) -> Int {
        var ans = Int.min
        var lastArr : Array<Int> = []
        var firstNo = 0 //分数累加
        
        for i in 0..<array.count{ //循环
            firstNo = firstNo + array[i]
            
            var lastNo = 0
            for last in 0..<lastArr.count{
                lastNo = lastNo + lastArr[last] * (lastArr.count - last)
            }
            
            lastArr.append(array[i])
            
            if firstNo >= 100 {//必须上传
                firstNo = 100
                ans = max(ans, firstNo - lastNo)
                break
            }else{
                ans = max(ans, firstNo - lastNo)
            }
            
        }
        
        return ans
    }
}
