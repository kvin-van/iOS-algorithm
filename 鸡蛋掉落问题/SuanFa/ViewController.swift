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
        
        
       
        print("最少次数：\(self.numberOfTimes(2, 100)) 次")
        print("最少次数：\(self.numberOfTimes(20, 110)) 次")
        
        print("最少次数：\(self.numberOfTimes2(2, 100)) 次")
        print("最少次数：\(self.numberOfTimes2(20, 110)) 次")
        
    }
    
    
    // MARK: -
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
//            var ret : Int = Int.max //记录每次返回的最小值
            while low+1 < high {
                let x = (low + high)/2
                //然后套用公式
                let t1 = self.numberOfTimes2(k-1, x-1)
                let t2 = self.numberOfTimes2(k, n-x)
                
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
    

    
}

