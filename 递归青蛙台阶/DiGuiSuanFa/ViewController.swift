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
        print("\(self.qingWaJump(2))")
        print("\(self.qingWaJump(7))")
        //动态规划
        print("\(self.qingWaJump2(2))")
        print("\(self.qingWaJump2(7))")
    }

    /*描述
     力扣 剑指 Offer 10- II. 青蛙跳台阶问题
    一只青蛙一次可以跳上1级台阶，也可以跳上2级。求该青蛙跳上一个 n 级的台阶总共有多少种跳法（先后次序不同算不同的结果）。
    数据范围：1≤n≤40  要求：时间复杂度：O(n) ，空间复杂度：O(1)
     输入：n = 2
     输出：2
     
     输入：n = 7
     输出：21
     */
    //递归思路 递减后最终达到0或者1然后计算路径
    func qingWaJump(_ jump : Int ) -> Int
    {
        if jump <= 1{
            return 1;
        }
        //当 jump =1 的时候 走不到这 直接返回1
        return qingWaJump(jump - 1) + qingWaJump(jump - 2)
    }

    //动态规划方案
    func qingWaJump2(_ jump : Int ) -> Int
    {
        var result : Dictionary<Int,Int> = [:]
        result[1] = 1
        result[2] = 2
        if jump <= 2{
            return result[jump]!
        }
        
        for index in 3...jump{ //方案叠加
            result[index] = result[index - 1]! + result[index - 2]!  // 3 方案= 方案1 + 方案2
        }
        return result[jump]!
    }
}

