//
//  ViewController.swift
//  SuanFa
//
//  Created by 王本东 on 2021/3/8.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //鸡蛋问题
//        print("最少次数：\(self.numberOfTimes(2, 100)) 次")
//        print("最少次数：\(self.numberOfTimes(20, 110)) 次")
//
//        print("最少次数：\(self.numberOfTimes2(2, 100)) 次")
//        print("最少次数：\(self.numberOfTimes2(20, 110)) 次")
        
        
        //背包问题
//        var some1 : Something {
//            .init(value: 3, weight: 1)
//        }
//        var some2 : Something{
//            .init(value: 8, weight: 5)
//        }
//        let some3 : Something = .init(value: 5, weight: 1)
//        let some4 : Something = .init(value: 10, weight: 1)
//        print("最多价值：\(knapsackProblem(6, 2, [some1,some2]))")
//        print("最多价值：\(knapsackProblem(6, 3, [some1,some2,some3]))")
//        print("最多价值：\(knapsackProblem(6, 4, [some1,some2,some3,some4]))")
        
        //和上面不能同时打开 因为 data是一个
        let any1 : Something = .init(value: 6, weight: 3)
        let any2 : Something = .init(value: 10, weight: 1)
        let any3 : Something = .init(value: 5, weight: 2)
        let any4 : Something = .init(value: 10, weight: 4)
        print("最多价值：\(knapsackProblem(5, 3, [any1,any2,any3]))")
        print("最多价值：\(knapsackProblem(5, 4, [any1,any2,any3,any4]))")
        print("最多价值：\(knapsackProblem(6, 3, [any1,any2,any3]))")
        print("最多价值：\(knapsackProblem(6, 4, [any1,any2,any3,any4]))")
    }
    
    
    // MARK: - 鸡蛋问题
//MARK: 方法一
    /*
     k 鸡蛋  n楼层   0<k<∞    0<n<∞
     输入：k=2 ; n = 100
     输出： 14
     */
    var dataDic1 : [String : Int] = [:]
    func numberOfTimes(_ k : Int,_ n: Int) -> Int {
        if dataDic1["\(k)\(n)"] != nil &&  dataDic1["\(k)\(n)"] != 0 {  /* 查看备忘录，有记录则跳过 */
            return dataDic1["\(k)\(n)"] ?? 0
        }
        
        if k == 1{ /* 只有一个鸡蛋，至少需要扔n次 */
            return n
        }
        
        if n < 2{ /* 已经扔到最后一层楼了，则不需要扔了，返回0 */
            return n
        }
        //初始化返回值  因为需要比较最小值 所以初始化为INT_MAX
        var ret : Int = Int.max
        /* 一层一层楼进行排查，
         * 从第一层1开始遍历到最后一层n。
         */
        for i  in 1...n{

            let broken  = numberOfTimes( k - 1, i - 1);

            let notbroken  = numberOfTimes( k , n - i);
            /* 考虑到题目要求最坏情况下，则需要取两者中的较大值 */
            if broken > notbroken {
                ret = min(ret, broken + 1);
            }
            else {
                ret = min(ret, notbroken + 1);
            }
        }
        
        /* 更新备忘录 */
        dataDic1["\(k)\(n)"] = ret;
        return ret
    }

    // MARK: 方法二
    //公式 ： dp(k,n)=1+ min(max(dp(k−1,x−1),dp(k,n−x)))  // 1≤x≤n
    var dataDic2 : [String : Int] = [:]
    func numberOfTimes2(_ k : Int,_ n: Int) -> Int {
        var ans : Int = Int.max
        
        if dataDic2["\(k)\(n)"] != nil &&  dataDic2["\(k)\(n)"] != 0 {  /* 查看备忘录，有记录则跳过 */
            ans = dataDic2["\(k)\(n)"]!
            return ans
        }

        if k == 1{ /* 只有一个鸡蛋，至少需要扔n次 */
            ans = n
        }
        else if n <= 2{ /* 一层楼 只能扔一次  没楼层不用扔，2层楼的时候 一层破了是1次，2楼破了还要扔 取大还是2*/
            ans = n
        }
        else{
            var low  = 1  //记录最低楼层
            var high = n
            while low+1 < high {  //当鸡蛋2个或者超过2个的时候 第一次肯定是二分法扔 从楼层中间扔
                let x = (low + high)/2
                //然后套用公式
                let t1 = self.numberOfTimes2(k-1, x-1)// 碎了
                let t2 = self.numberOfTimes2(k, n-x) // 没碎
                
                if t1<t2{ //没碎的次数会比较多
                    low = x
                }
                else if t1 > t2{
                    high = x
                }
                else{
                    low = x
                    high = x
                }
            }
            ans = 1 + min(max(numberOfTimes2(k - 1, low - 1), numberOfTimes2(k, n - low)), max(numberOfTimes2(k - 1, high - 1), numberOfTimes2(k, n - high)))
        }
        
        /* 更新备忘录 */
        dataDic2["\(k)\(n)"] = ans;
        return ans
    }
    
    // MARK: - 背包问题
    //公式 ： kp(w,n)=max(kp(w-weight,n−1),kp(w,n−1))
    struct Something {
        let value : Int
        let weight : Int
    }
    var knapsackDic : [String : Int] = [:]//保存字典
    func knapsackProblem(_ weights : Int,_ number : Int, _ array : Array<Something>) -> Int {
        let tempArr : Array<Something> = array
        
        if knapsackDic["\(weights)\(number)"] != nil && knapsackDic["\(weights)\(number)"] != 0{  /* 查看备忘录，有记录则跳过 */
            return knapsackDic["\(weights)\(number)"]!
        }
        
        if weights < 1{ //没有重量了
            return 0
        }
        else if number < 1{//没有数量
            return 0
        }
        else{
            for i in 0...number-1{
                let st = tempArr[i] //当前物品
                
                if st.weight > weights{
                    var weightsArr : Array<Something> = []
                    if i > 0 {
                        weightsArr = Array(tempArr[0...i-1])
                    }
                    knapsackDic["\(weights)\(number)"] = knapsackProblem(weights, weightsArr.count, weightsArr)
                }
                else{
                    var setArr : Array<Something> = []
                    if i > 0 {
                        setArr = Array(tempArr[0...i-1])
                    }
                    let setSomething = st.value + knapsackProblem(weights - st.weight, setArr.count, setArr)
                    let noSetSomething = knapsackProblem(weights, setArr.count, setArr)
                    
                    if knapsackDic["\(weights)\(i+1)"] == nil || knapsackDic["\(weights)\(i+1)"] == 0{
                        knapsackDic["\(weights)\(i+1)"] = max(setSomething, noSetSomething)
                    }
                }
            }
        }
        
//        print("\(knapsackDic)")
        return knapsackDic["\(weights)\(number)"] ?? 0
    }

    
}

