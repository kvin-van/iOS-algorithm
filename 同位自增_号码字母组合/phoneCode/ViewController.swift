//
//  ViewController.swift
//  phoneCode
//
//  Created by 王本东 on 2023/9/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*题目来源：力扣（LeetCode） 电话号码的字母组合
         
         题目：给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。答案可以按 任意顺序 返回。
         给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
         
         例子

         输入：digits = "23"
         输出：["ad","ae","af","bd","be","bf","cd","ce","cf"]

         输入：digits = ""
         输出：[]

         输入：digits = "2"
         输出：["a","b","c"]

         解题思路：
         题意不难理解, 拿 "", "2", "23" 举例, 其结果依次
         []
         ["a","b","c"]
         ["ad","ae","af","bd","be","bf","cd","ce","cf"]
         可看出, 每增加1位数字, 只是在上一个结果上, 依次新增加新数字位的字母子位
         */
        print(letterCombinations("23"))
        print(letterCombinations("234"))
    }

    func letterCombinations(_ digits: String) -> [String] {

        // 如果没有传入字母, 直接返回空数组即可
        if digits.count == 0 { return [] }
        
        // 定义字母字典, 放在方法外面也可
        let dic = ["2":["a", "b", "c"],
                   "3":["d", "e", "f"],
                   "4":["g", "h", "i"],
                   "5":["j", "k", "l"],
                   "6":["m", "n", "o"],
                   "7":["p", "q", "r", "s"],
                   "8":["t", "u", "v"],
                   "9":["w", "x", "y", "z"]]
        
        // 定义结果res
        var res = [""]
        
        // 定义结果遍历传入字母
        for i in digits {
            
            // 找到数字位表示的字母数组
            let n:[String] = dic[String(i)]!

            // 定义容器数组
            var temp = [String]()
            
            // 找到数字位表示的字母数组二次循环
            for j in n {
               
                // 三次循环字母数组
                for z in res {
                    
                    // 在之前数组的每一位上增加新字母
                    temp.append(z + j)
                }
            }
            
            // 重置结果为新数组
            res = temp
        }
        
        // 返回结果
        return res;

    }

}

