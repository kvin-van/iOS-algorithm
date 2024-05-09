//
//  IntoArray.swift
//  huawei
//
//  Created by 王本东 on 2023/6/8.
//

import Foundation


class IntoArray : Any
{
    //MARK: - 华为OD 2023 03
    //思路：
    var intoArr : Array<Array<Int>> = []
    var tempIntoArr :  Array<Array<Int>> = []
    var start = true
    func findEntrance(_ n : Int , _ m : Int , _ array : Array<Array<String>>) ->String
    {
        intoArr.removeAll()
        tempIntoArr.removeAll()
        
        var result : Int = 0
        for i in 0..<2*m { //筛选入口
            var m1 : String
            if i < m{  //四边形的上边框
                m1 = array[0][i]
                if m1 == "O"{
                    intoArr.append([0,i])
                }
            }
            else{ //下边框 各m个
                m1 = array[n-1][i-m]
                if m1 == "O"{
                    intoArr.append([n-1,i-m])
                }
            }
        }
        
        for i in 1...2*(n - 2){ //筛选入口
            var n1 : String
            if i <= n - 2{  //左侧 边框的中间
                n1 = array[i][0]
                if n1 == "O"{
                    intoArr.append([i,0])
                }
            }
            else{ //右侧 边框的中间
                n1 = array[i - (n - 2)][m-1]
                if n1 == "O"{
                    intoArr.append([i - (n - 2),m - 1])
                }
            }
        }
//        print(intoArr)  // 筛选入口 完成✅
        if intoArr.count < 1{
            return "NULL"
        }
        
        var resultArr : [[Int]] = []
        
        for arr in intoArr{  //循环找到的入口
            var nmArr = Array(array)
            tempIntoArr = Array(intoArr)
            tempIntoArr.removeAll { array1 in  //删除要代入的计算的入口  留下剩余的入口
                array1 == arr
            }
            var flag = 1
            start = true
            findOAction(arr[0], arr[1], array: &nmArr, &flag)
            if  !start{
                continue
            }
            
            if flag > result{
                resultArr.removeAll()
                result = flag
                let ans = [arr[0],arr[1],result]
                resultArr.append(ans)
            }
            else if flag == result{
                let ans = [arr[0],arr[1],result]
                resultArr.append(ans)
            }
        }
        
        //结果
        if resultArr.count < 1{
            return "NULL"
        }
        if resultArr.count == 1{
            let ans = resultArr[0]
            return "\(ans[0]) \(ans[1]) \(ans[2]) "
        }
        else{
            return "\(resultArr[0][2]) "
        }
    }
    
    func findOAction(_ i : Int , _ j : Int ,array : inout Array<Array<String>> ,_  flag : inout Int)
    {
        let n = array.count
        let m = array[0].count
        
        let tempArr = [i,j]
        if tempIntoArr.contains(tempArr){
            flag = 0
            start = false
            return
        }
        array[i][j] = "X"
        // top
        if i - 1 >= 0 {
            let top = array[i-1][j]
            if top == "O"{
                flag += 1
                findOAction(i-1, j, array: &array, &flag)
            }
        }
        // left
        if  j - 1 >= 0 {
            let left = array[i][j-1]
            if left == "O"{
                flag += 1
                findOAction(i, j-1, array: &array, &flag)
            }
        }
        //bottom
        if  i + 1 < n{
            let bottom = array[i+1][j]
            if bottom == "O"{
                flag += 1
                findOAction(i+1, j, array: &array, &flag)
            }
        }
        //right
        if  j + 1 < m{
            let right = array[i][j+1]
            if right == "O"{
                flag += 1
                findOAction(i, j+1, array: &array, &flag)
            }
        }
    }
    
    // MARK: - 方法2  更容易理解
    //思路：循环入口   递归代入
    func findEntrance2(_ n : Int , _ m : Int , _ array : Array<Array<String>>) ->String
    {
        var intoArr : [(Int,Int)] = []
        for i in 0...n-1{ //循环 把所有O入口都找到
            for j in 0...m-1{
                let value = array[i][j]
                if i == 0 && value == "O"{ // 上面
                    intoArr.append((i,j))
                }
                else if i == n-1 && value == "O"{  // 下面
                    intoArr.append((i,j))
                }
                else if j == 0 && value == "O"{ //左
                    intoArr.append((i,j))
                }
                else if j == m-1 && value == "O"{ // 右
                    intoArr.append((i,j))
                }
            }
        }
        if intoArr.count<1{ //没有直接返回
            return "NULL"
        }
//        print(intoArr)
        var resultArr : [Array<Int>] = []
        
        for val in intoArr{ //循环全部入口
            var tempIntoArr : [(Int,Int)] = intoArr //去掉当前的 入口
            tempIntoArr.removeAll { item in
                item == val
            }
            
            var flag : Int = 0
            var tempArr = Array(array)
            findOAction2(n, m, &tempArr,  &flag, &tempIntoArr, val)
            if flag == -1 {
                continue
            }
            resultArr.append([val.0,val.1,flag])
            flag = 0
        }
        
        //算答案
        if resultArr.count < 1{
            return "NULL"
        }
        else{ //有效区域
            var maxValue : (length:Int,count:Int) = (0,0) //最大区域值 和 重复数
            var ansArr : Array<Int> = [] // 答案
            for array in resultArr{ //循环找出最多的 1个或者多个
                if maxValue.length < array[2]{
                    maxValue.length = array[2]
                    maxValue.count = 1
                    ansArr = array
                }
                else if maxValue.length == array[2]{ // 最大 且一样
                    maxValue.count += 1
                }
            }
            
            if maxValue.count > 1{ // 最大的区域 是多个
                return "\(maxValue.length)"
            }else{ //只有一个最大
                return "\(ansArr[0]) \(ansArr[1]) \(ansArr[2])"
            }
        }
    }
    
    // n，m  array把O改成X的数组
    //数量flag
    //intoArr不包含自己入口的入口数组，
    //当前坐标value
    func findOAction2(_ n : Int , _ m : Int ,_ array : inout Array<Array<String>>,_ flag: inout Int ,_ intoArr : inout Array<(Int,Int)>, _ value:(Int,Int))
    {
        //判断
        let x = array[value.0][value.1]
        if x == "X"{
            return
        }
        //2个入口
        let isContains = intoArr.contains{$0 == value}
        if isContains {
            flag = -1
        }
        if flag == -1 {
            return
        }
        
        // +1  符合条件 改X
        if x == "O" && flag != -1{
            flag = flag+1
            array[value.0][value.1] = "X"
        }
        
        //上
        if value.0 - 1 >= 0{
            findOAction2(n, m, &array,  &flag, &intoArr, (value.0-1,value.1))
        }
        //下
        if value.0 + 1 <= n-1{
            findOAction2(n, m, &array,  &flag, &intoArr, (value.0+1,value.1))
        }
        //左
        if value.1 - 1 >= 0{
            findOAction2(n, m, &array,  &flag, &intoArr, (value.0,value.1-1))
        }
        //右
        if value.1 + 1 <= m-1{
            findOAction2(n, m, &array,  &flag,&intoArr,  (value.0,value.1+1))
        }
    }
    
}
