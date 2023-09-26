//
//  ViewController.swift
//  DiGuiSuanFa
//
//  Created by 王本东 on 2023/5/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("结果：\(self.fillArrayBest([0,4,5], 6))")
        print("结果：\(self.fillArrayBest([1,0,0], 3))")
//        print("结果：\(self.fillArrayBest([0,0,0,0,0,67,0,0], 100))")
    }

    /*描述
     腾讯音乐2022校园招聘移动客户端类岗位笔试
     数组值为0 可以任意替换，满足  a(0) <= a(1) <= a(n-1)    1<=a(i)<= k
     给定一个数组  和 k正整数  求满足添加方案
     输入例子： [0,4,5],6
     输出例子：4
     例子说明： 所有的合法填充方案是：[1,4,5],[2,4,5],[3,4,5],[4,4,5]，共4种。
     
     输入例子：     [1,0,0],3
     输出例子：     6
     例子说明：     所有的合法填充方案是：[1,1,1],[1,1,2],[1,2,2],[1,2,3],[1,3,3],[1,1,3]共6种
     
     输入例子：     [0,0,0,0,0,67,0,0],100
     输出例子：     746845806
     */
    //递归思路 找出可变位 循环带入
    
    // MARK: -  最近重写
    func fillArrayBest2(_ a :  Array<Int>,_ k : Int ) -> Int
    {
        var nextArr : [Int] = []
        for i in 0...a.count-1{
            let x = a[i]
            if x == 0{
                nextArr.append(i)
            }
        }
//        print(nextArr)
    
        var tempArr = Array(a)
        var result : Int = 0
        if nextArr.count>1{
            for i in 0..<nextArr.count{
                let index = nextArr[i]
                let forwardBack = forwardAndBack(tempArr, k, index) // 算前一个值和后一个值
                for x in forwardBack.0...forwardBack.1{
                    tempArr[index] = x
                    result += fillArrayBest(tempArr, forwardBack.1)
//                    print(result)
                }
            }
        }
        else if nextArr.count == 1{
            let forwardBack = forwardAndBack(tempArr, k, nextArr[0])
            result += forwardBack.1 - forwardBack.0 + 1
        }
       
        return result
    }
    // 算前一个值和后一个值
    func forwardAndBack(_ array :  Array<Int>,_ k : Int,_ index:Int )->(Int,Int)
    {
        var forward : Int
        var backward : Int
        if index == 0{
            forward = 1
        }else{
            forward = array[index-1]
        }
        if index == array.count-1{
            backward = k
        }
        else{
            backward = array[index+1]
            if backward == 0{
                backward = k
                for index2 in index+1...array.count-1{
                    let value = array[index2]
                    if value == 0{
                        continue
                    }else{
                        backward = value
                        break
                    }
                }
            }
        }
        return (forward,backward)
    }
    
    func fillArray(_ a :  Array<Int>,_ k : Int ) -> Int
    {
        var result : Int = 0
        var iEndArr :Array<Int> = []  // 记录滑动结束的点
        for i in 0...a.count-1{//记录可变位
            let index = a[i]
            if index == 0{
                iEndArr.append(i)
            }
        }
        var aNew = a
        if iEndArr.count > 1 {
            let i = iEndArr[0]
            for index in 1...k{
                aNew[i] = index
                result += self.fillArray(aNew, k)
                print("当位置\(i)的值是\(index)的时候是\(result)")
            }
        }else if iEndArr.count == 1{
            let i = iEndArr[0]
            
            for index in 1...k{
                aNew[i] = index
                var lastValue = 0
                var current = 0
                
                for j in 0...aNew.count-1{
                    if j == 0 {
                        lastValue = aNew[j]
                        continue
                    }
                    else{
                        current = aNew[j]
                    }
                    print("上一个：\(lastValue) , 当前：\(current)");
                    //判断
                    if lastValue <= current {
                        lastValue = current
                        if  j == aNew.count-1{
                            result += 1
                        }
                    }
                    else{
                       break
                    }
                } // 数组循环
            }
        }else{
            return 0
        }
        
        return result
    }
    
    // MARK: -  优化算法
    func fillArrayBest(_ a :  Array<Int>,_ k : Int ) -> Int
    {
        var result : Int = 0
        var iEndArr :Array<Int> = []  // 记录滑动结束的点
        var yuanzu : (index : Int,value : Int) = (0,0) //记录最大的固定值
        for i in 0...a.count-1{//记录可变位
            let index = a[i]
            if index == 0{
                iEndArr.append(i)
            }
            else{ // 不可变位置
                yuanzu = max(index, yuanzu.value) == index ? (i,index) : (yuanzu.index,yuanzu.value)
            }
        }
        var aNew = a // 转化动态数组
        if iEndArr.count > 1 {
            let i = iEndArr[0]
            for index in 1...k{
                aNew[i] = index
                result += self.fillArrayBest(aNew, k)
//                print("当位置\(i)的值是\(index)的时候是\(result)")
            }
        }else if iEndArr.count == 1{
            let i = iEndArr[0]
            var start = 1 //动态约束 起末
            var end = k
            if i > yuanzu.index{
                start = yuanzu.value
            }
            else if i < yuanzu.index{
                end = yuanzu.value
            }
            
            for index in start...end{
                aNew[i] = index
                var lastValue = 0
                var current = 0
                
                for j in 0...aNew.count-1{
                    if j == 0 {
                        lastValue = aNew[j]
                        continue
                    }
                    else{
                        current = aNew[j]
                    }
//                    print("上一个：\(lastValue) , 当前：\(current)");
                    //判断
                    if lastValue <= current {
                        lastValue = current
                        if  j == aNew.count-1{
                            result += 1
                        }
                    }
                    else{
                       break
                    }
                } // 数组循环
            }
        }else{
            return 0
        }
        
        return result
    }
    
    /*
     vector<long long> res;
           long long ans=1,mod=1000000007;
           long len=a.size(),l=0,r=0;
           a.insert(a.begin(),1);
           a.push_back(k);
           for(long i=0;i<len+2;i++){
               if(a[i]==0){
                   l=i-1;
                   while(a[i]==0)
                       i++;
                   r=i;
                   vector<long long> tmp(a[r]-a[l]+1,1);
                   for(long j=r-l-1;j>0;j--){
                       for(long long t=a[r]-a[l]-1;t>=0;t--){
                           tmp[t]+=tmp[t+1]%mod;//样例数很恶心，时刻注意取余
                       }
                   }
                   res.push_back(tmp[0]%mod);
               }
           }
           for(long i=0;i<res.size();i++)
               ans=(ans*res[i])%mod;
           return ans;
     */
    
}

