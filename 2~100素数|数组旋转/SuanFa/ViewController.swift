//
//  ViewController.swift
//  SuanFa
//
//  Created by 王本东 on 2023/5/10.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //素数质数 问题
        var array = self.primeNumber(100)
        print("\(array)\n \(array.count)")
        
        //旋转数组
        var array2 = [1,2,3,4,5]
       let array3 = self.rotateArrayByMPositions(&array2,  2, array2.count)
        print("\(array3)")
        print("\(self.rotateArrayByMPositions(&array2,  4, array2.count))")
        print("\(self.rotateArrayByMPositions(&array2,  1, array2.count))")
    }
    //力扣  204. 计数质数
    //从2到100中,有25个素数,它们是： 2,3,5,7,11,13 17,19,23,29,31,37  41,43,47,53,59,61  67,71,73,79,83,89  97
    //素数就是质数，有无限个。除了1和该数本身以外不再有其他的因数的数被称为素数
    func primeNumber(_ number : Int) -> Array<Int>
    {
        var array : Array<Int> = []
        
        for x in 2...number{
            //优化： 大于10的数字如果能被2和5整除肯定不是质数
            if x > 9 && (x%2 == 0 || x%5 == 0) {
                continue
            }
            
            for y in 2...x {
                if x%y == 0 && x != y {
                    break
                }
                else if y == x{
                    array.append(y)
                }
            }
        }
        
        return array
    }
    
    
    // MARK: -  旋转数组
    //循环右移相当于从第m个位置开始，左右两部分视作整体翻转。即abcdefg右移3位efgabcd可以看成AB翻转成BA（这里小写字母看成数组元素，大写字母看成整体）。既然是翻转我们就可以用到reverse函数
    func rotateArrayByMPositions(_ arr: inout [Int], _ move: Int ,_ length : Int) -> Array<Int>
    {
        // 如果M等于数组长度或M为0，则不需要进行移动
        if move == 0 || move == length {
            return arr
        }
        
        // 确保M小于数组长度
        let moveBy : Int = move % length
        //第一次反转
        var tempArr =  Array(arr.reversed()) //必须初始化 不初始化  tempArr =arr.reversed() 不行。
        //第2次反转
        let firstArr = Array(tempArr[0..<moveBy].reversed());
        tempArr.replaceSubrange(Range(0...moveBy-1), with: firstArr)
        //第3次反转
        let lastArr = Array(tempArr.dropFirst(moveBy).reversed())
        tempArr.replaceSubrange(Range(moveBy...length-1), with: lastArr)
        
        return tempArr
    }
    
}

