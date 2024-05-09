//
//  ViewController.swift
//  lianxi
//
//  Created by 王本东 on 2023/9/8.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                findRoot([1,2,3,4,5,6,7])
                findRoot([1,2,3,4,5,6,7,8,9,10,11,12])
        findRoot([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16])
                
        }
            /*
             题目：给定一个完全二叉树
                                  1
                      2                    3
                 4         5           6      7
             8    9   10 11    12
             从最下面顺序打印 根节点    456231
             */
    //思路： 二维数组存取 然后倒序遍历   [[1], [2, 3], [4, 5, 6, 7]]  数组个数为2的n次方 n从0 开始 ，最后一组根节点根据 最后的数组个数判断是否为有效根节点
    func findRoot(_ array: Array<Int>) ->Void
    {
        var resultArr : Array<Array<Int>> = [] //二维数组
        var n :CGFloat = 0.0//次方
        var arrCount = pow(2.0, n)
        
        var tempArr : Array<Int> = [] //饱和就 添加
        for index in 0..<array.count{ //填满二维数组
            let value = array[index]
//            print(tempArr)
//            print(n,arrCount)
            tempArr.append(value)
            
            if tempArr.count == Int(arrCount){ //满足容量
                resultArr.append(tempArr)
                n += 1
                if  index != array.count-1{ //说明不是正好的
                    arrCount = pow(2.0, n)
                }
                tempArr.removeAll()
            }
            
            if index == array.count-1 && tempArr.count>0{ //最后一次
                resultArr.append(tempArr)
            }
        }
        print("结果",resultArr)
        //最后一组 需要判断 是否 是根结点
        var x = Int(arrCount) - resultArr.last!.count
        if x < 2{ //差一个 倒数第二层全部都是根结点
            x = 0
        }else{
                x = x/2 //这里不用分析 是否%==1
        }
        
        //打印
        var resultStr : String = ""
        let rang = 0..<resultArr.count-1
        for index in rang.reversed(){
            let arrs = resultArr[index]
            
            if index == resultArr.count-2{ //最后一组
                for index in 0..<arrs.count-x{ //减去不是根节点的
                    let number = arrs[index]
                    resultStr = resultStr + String(number) + " "
                }
            }
            else{
                for index in 0..<arrs.count{
                    let number = arrs[index]
                    resultStr = resultStr + String(number) + " "
                }
            }
        }
        print(resultStr)
    }
    
    //方式2 采用元组  把元组模拟 成 二叉树结构 添加到数组里，  ⚠️肯能还有些问题。
    func findRoot2(_ array: Array<Int>) ->Void
    {
        var index = 1
        var flag = 1
        var leftRight  = 0
        var inserFalg = 0
        var lastRoot = array[inserFalg]
        var tree : (root:Int?,left:Int?,right:Int?) = (nil,nil,nil)
        var ansArr : [(Int?,Int?,Int?)] = []
        var deep: Int = 1
        var ansArr2 : [[(Int?,Int?,Int?)]] = []
        
        while index<=array.count{
            let x = array[index-1]
            
           if flag%3 == 1 {
                tree.root = x
               flag += 1
            }
            else if flag%3 == 2 {
                 tree.left = x
                flag += 1
             }
            else if flag%3 == 0 {
                 tree.right = x
                flag += 1
                if ansArr2.count == 0{
                    ansArr.append(tree)
                    lastRoot = tree.root!
                    if ansArr.count == deep{
                        ansArr2.append(ansArr)
                        ansArr.removeAll()
                        deep = deep * 2
                    }
                }
                else if leftRight == 0{
                    ansArr.append(tree)
                    leftRight = 1
                }else{
                    ansArr.append(tree)
                    leftRight = 0
                    inserFalg =  inserFalg + 1
                    lastRoot = array[inserFalg]
                    if ansArr.count == deep{
                        ansArr2.append(ansArr)
                        ansArr.removeAll()
                        deep = deep * 2
                    }
                }
                
                tree =  (nil,nil,nil) //新
                if  leftRight == 0{
                    for arr in ansArr2{
                        for tuple in arr{
                            if tuple.0! == lastRoot{
                                tree.root = tuple.1
                                break
                            }
                        }
                    }
                }else{
                    for arr in ansArr2{
                        for tuple in arr{
                            if tuple.0! == lastRoot{
                                tree.root = tuple.2
                                break
                            }
                        }
                    }
                }
                flag += 1
             }
            
            if tree.0 != nil && index==array.count{
                ansArr.append(tree)
            }
            index += 1
        }
        if ansArr.count>0{
            ansArr2.append(ansArr)
        }
        var result : String = ""
        let rang = 0..<ansArr2.count
        for y in rang.reversed(){
            let arrs = ansArr2[y]
            for z in arrs{
                result = result + String(z.0!) + " "
            }
        }
        print(result)
    }
}


