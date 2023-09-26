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
//        let any1 : Something = .init(value: 6, weight: 3)
//        let any2 : Something = .init(value: 10, weight: 1)
//        let any3 : Something = .init(value: 5, weight: 2)
//        let any4 : Something = .init(value: 10, weight: 4)
//        print("最多价值：\(knapsackProblem(5, 3, [any1,any2,any3]))")
//        print("最多价值：\(knapsackProblem(5, 4, [any1,any2,any3,any4]))")
//        print("最多价值：\(knapsackProblem(6, 3, [any1,any2,any3]))")
//        print("最多价值：\(knapsackProblem(6, 4, [any1,any2,any3,any4]))")
        
        //放苹果
        print("放苹果:\(self.saveApple(4, 4))")
        print("放苹果:\(self.saveApple(7, 3))")
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
            /* 在当前楼层i处鸡蛋破了，
             * 那么需要递归遍历剩下的1..i-1层共i-1层，
             * 鸡蛋个数也需要减1变为k-1个。
             */
            let broken  = numberOfTimes( k - 1, i - 1);
            
            /* 在当前楼层i处鸡蛋没破，
             * 那么需要递归遍历剩下的i+1...n层共n-i层，
             * 鸡蛋个数不需要减1还为k个。
             */
            let notbroken  = numberOfTimes( k , n - i);
            /* 考虑到题目要求最坏情况下，则需要取两者中的较大值    等同于   min(ret,max(broken+1,notbroken+1)) */
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
//            var ret : Int = Int.max //记录每次返回的最小值
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
            //! 我们找到最佳的投放鸡蛋的楼层后，开始计算
            //! 1. 在left扔鸡蛋，计算  f 在 left 下方 和 在上方的 最坏的情况，也就是求最大值
            //! 2. 同理，在 right 扔鸡蛋，计算  f 在 right 下方 和 在上方的 最坏的情况，也就是求最大值
            //! 3. 最后，我们拿到其中的最小值，那就是我们要求的最小步骤，加上1，也就是本次的操作数。
            ans = 1 + min(max(numberOfTimes2(k - 1, low - 1), numberOfTimes2(k, n - low)), max(numberOfTimes2(k - 1, high - 1), numberOfTimes2(k, n - high)))
        }
        
        /* 更新备忘录 */
        dataDic2["\(k)\(n)"] = ans;
        return ans
    }
    
    // MARK: - 背包问题
    //这里你有N件物品和一个容量为M的背包，这N件物品的第 i 件物品的 价值是V[i] ，重量是W[i].问题是拿取这N件物品的哪几件时，使得背包可以装下（意思就是物品的重量总和小于或等于M）且价值最大。
    //公式 ： kp(w,n)=max(kp(w-weight,n−1),kp(w,n−1))
    /*一个物品   (6,3)(10,1)(5,2)
     6 0
     6 0
     16 6
     6 0
     10 6
     15 16
     1 有6的时候 6  没有的时候 0  取6
     2 有10的时候 16  没有的时候6  取16
     3 不放6的时候 10 只有6的时候6 取10
     4 有5的时候 15  没有的时候 10  取15
     */

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
                
                if st.weight > weights{ //当前物品 比现有的背包重量还大  取没有这个物品时，的最大容量
                    var weightsArr : Array<Something> = []
                    if i > 0 {
                        weightsArr = Array(tempArr[0...i-1])
                    }
                    knapsackDic["\(weights)\(number)"] = knapsackProblem(weights, weightsArr.count, weightsArr)
                }
                else{
                    var setArr : Array<Something> = []  //不管 放不放都要递归的  去掉当前物品的数组
                    if i > 0 {
                        setArr = Array(tempArr[0...i-1])// 排除自己 跟没有自己的时候比 放了和没放的情况 取最大值
                    }
                    //放了
    //                    let setArr : Array<Something>  = tempArr.removeSubrange( i..<tempArr.count) as! Array<Something> //直接删除  或者强转或报错和崩溃
                    let setSomething = st.value + knapsackProblem(weights - st.weight, setArr.count, setArr)
                        //没放
                    let noSetSomething = knapsackProblem(weights, setArr.count, setArr)
                    
//                    print(setSomething ,noSetSomething)
                    if knapsackDic["\(weights)\(i+1)"] == nil || knapsackDic["\(weights)\(i+1)"] == 0{
                        knapsackDic["\(weights)\(i+1)"] = max(setSomething, noSetSomething)
                    }
                }
            }
        }
        
//        print("\(knapsackDic)")
        return knapsackDic["\(weights)\(number)"] ?? 0
    }
    

    
    
    // MARK: - 放苹果问题
    /*
     有m个苹果,n个盘子,允许有的盘子空着不放,请问有多少种不同的放法
     0 1 2 3 4
     1  1 1 1 1
     2 1 2 2 2
     3 1 2 3 3
     4 1 3 4 5
     设f(m,n) 为m个苹果，n个盘子的放法数目，则先对n作讨论，
     当n>m：必定有n-m个盘子永远空着，去掉它们对摆放苹果方法数目不产生影响。即if(n>m) f(m,n) = f(m,m)
     当n<=m：不同的放法可以分成两类： 有空盘子和没空盘子2中情况
     1、有至少一个盘子空着，即相当于f(m,n) = f(m,n-1);
     2、所有盘子都有苹果，相当于可以从每个盘子中拿掉一个苹果，不影响不同放法的数目，即f(m,n) = f(m-n,n).
     而总的放苹果的放法数目等于两者的和，即 f(m,n) =f(m,n-1)+f(m-n,n)
     递归出口条件说明：
     当n=1时，所有苹果都必须放在一个盘子里，所以返回１；
     当没有苹果可放时，定义为１种放法；
     递归的两条路，第一条n会逐渐减少，终会到达出口n==1;
     第二条m会逐渐减少，因为n>m时，我们会return f(m,m)　所以终会到达出口m==0．
     */
    var appleDic : Dictionary<String , Int> = [:]
    func saveApple(_ apple : Int , _ n : Int) -> Int{
        if let num = appleDic[String(format: "%d,%d", apple,n)] {
            return num
        }
        
        var ans = 0
        if n <= 1{
            appleDic[String(format:" %d,%d", apple,n)] = 1
            return 1
        }
        if apple <= 1{
            appleDic[String(format: "%d,%d", apple,n)] = 1
            return 1
        }
        
        ans = saveApple(apple, n-1) + saveApple(apple-n, n)
        print("\(saveApple(apple, n-1)) == \(saveApple(apple-1, n-1))")
        appleDic[String(format: "%d,%d", apple,n)] = ans
        return ans
    }

    
}

