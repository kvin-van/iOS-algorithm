//
//  FindValue.swift
//  huawei
//
//  Created by 王本东 on 2023/6/6.
//

import Foundation

class FindValue: Any {
    
    //MARK: - 华为OD 2023 03
    //寻找二维数组每个数的相同数字的最短路径
    let arrayN = 3
    let arrayM = 5
    func findValue( array : Array<Array<Int>>) -> Array<Array<Int>>
    {
        var  tempArr : [[Int]] = []
        for i in 0..<arrayN{//拿列
            var nArr : Array<Int> = []
            for j in 0..<arrayM{ // 拿横
                let temp = array[i][j]
//                print("\(temp)")
                let flag = findAway(n: i, m: j, array: array, value: temp)
//                print("当前数值循环结束\(flag)")
                    nArr.append(flag)
            }
            tempArr.append(nArr)
        }
        
        return tempArr
    }
    
    //拿到值后遍历二维数组 遇到相同的值就按坐标计算距离
    func findAway(n : Int, m: Int , array : [[Int]] , value : Int) -> Int
    {
        var array1 = array
        array1[n][m] = -1 //排除自己
        var ans = 101
        for i in 0..<arrayN{//拿列
            for j in 0..<arrayM{ // 拿横
                let temp = array1[i][j]
                if temp == value{  //遇到相同的值
                    var x = n - i
                    if x < 0{
                        x = x * -1
                    }
                    else if x == 0 && i != n && j != m{
                        x = 1
                    }
                    
                    var y = m - j
                    if y < 0{
                        y = y * -1
                    }else if y == 0 && i != n && j != m{
                        y = 1
                    }
                    if (i == n-1 && j == m) || (i == n+1 && j == m) || (i == n && j == m-1) || (i == n && j == m+1){
                        ans = 1
                    }else{
                        ans = min(ans, x+y)
                    }
                }
            }
        }
        return ans == 101 ? -1 : ans
    }
    
    // MARK: - 方法2  
    func findValue2( array : Array<Array<Int>>) -> Array<Array<Int>>
    {
        //遍历 建立字典 key（数字）value（数组：包含元组（坐标））
        var  resultDic : [Int:Array<(Int,Int)>] = [:]
        for i in 0..<arrayN{//3行
            for j in 0..<arrayM{ // 5列
                let number = array[i][j]
                if var arr =  resultDic[number]{
                    arr.append((i,j))
                    resultDic[number] = arr
                }else{
                    var arr2 : [(Int,Int)] = []
                    arr2.append((i,j))
                    resultDic[number] = arr2
                }
            }
        }
//        print(resultDic)
        //计算每个点的值
        var resultArr :Array<Array<Int>> = []
        for i in 0..<arrayN{//3行
            var tempArr : [Int] = []
            for j in 0..<arrayM{ // 5列
                let number = array[i][j]
                let arr = resultDic[number]!
                if arr.count  == 1{
                    tempArr.append(-1)
                }
                else{//含有多个一样的数字
                    var distance = Int.max //距离
                    for item in arr{
                        if i == item.0 && j == item.1{ //自己不用算
                            continue
                        }
                        else{
                            var x = item.0 - i
                            if x < 0 {
                                x = x * -1
                            }
                            var y = item.1 - j
                            if y < 0 {
                                y = y * -1
                            }
                            distance = min(distance, x+y) // 取最短距离
                        }
                    }
                    tempArr.append(distance)
                }
            }
            resultArr.append(tempArr)
        }
        
        return resultArr
    }
    
}
