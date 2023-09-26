//
//  BoxPlacement.swift
//  huawei
//
//  Created by 王本东 on 2023/9/13.
//

import Foundation

class  BoxPlacement :Any
{
    // MARK: - 方法2
    //思路: 建立数组分别装字母    建立反复循环的机制
    func placementBox2(_ string : String , _ n : Int)->Void
    {
        var resultArr : Array<String> = []
        for _ in 0..<n{
            let str = ""
            resultArr.append(str)
        }
        
        var reverse = true //翻转
        var flag = 0
        for i in 0..<string.count{
            if reverse{
                let str = resultArr[flag]
                resultArr[flag] = str + string.dropFirst(i).prefix(1)
                if flag == n-1{
                    reverse = false
                }else{
                    flag += 1
                }
            }else{
                let str = resultArr[flag]
                resultArr[flag] = str + string.dropFirst(i).prefix(1)
                if flag == 0{
                    reverse = true
                }else{
                    flag -= 1
                }
            }
        }
        for string in resultArr{ // 打印
            print(string)
        }
    }
    
    // MARK: - 方法1
    func placementBox(_ string : String , _ n : Int)->Void
    {
        var resultArr : Array<Array<Character>> = []
        for _ in 0..<n{
            let array : Array<Character> = []
            resultArr.append(array)
        }
        
        let chatArr = string.map{$0}
        var reverse = true
        var flag = 0
        for x in chatArr{
            if reverse{
                var array  = resultArr[flag]
                array.append(x)
                resultArr[flag] = array;
                if flag == n-1{
                    reverse = false
                }else{
                    flag += 1
                }
            }else{
                var array  = resultArr[flag]
                array.append(x)
                resultArr[flag] = array;
                if flag == 0{
                    reverse = true
                }else{
                    flag -= 1
                }
            }
        }
        for i in 0..<n{
            let array  = resultArr[i]
            print(array.map { String($0) }.joined(separator: "") )
        }
    }
    
}
