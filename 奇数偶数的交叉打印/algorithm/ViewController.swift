//
//  ViewController.swift
//  algorithm
//
//  Created by 王本东 on 2023/12/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //奇数偶数的交叉打印
//        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9,10];
//        oddAndEvenNumbers(numbers);
        let arr = [1, 33, 55, 5, 5, 5, 5, 57, 2, 4, 5, 8, 9, 2, 1, 1, 1, 3, 4, 4, 4, 4, 11, 4, 4, 4, 4,222, 2, 2, 2, 22];
        oddAndEvenNumbers(arr);
        
//        for index in numbers.indices { //indices 属性对集合下标有效的索引，按升序排列。
//            print("\(index)")
//                let number = numbers[index]
//                if number % 2 == 0 {
//                    print("偶数: \(number)")
//                } else {
//                    print("奇数: \(number)")
//                }
//            }

    }
    // MARK: -  奇数偶数  成对 打印
    func oddAndEvenNumbers(_ array:Array<Int>) -> Void {
        // i 位置表示偶数、j 位置表示奇数
        var i = 0
        var j = 0
        while i<array.count && j<array.count {
            if array[i]%2 == 0 && array[j]%2 != 0{
                print("偶数:",array[i],"奇数:",array[j]);
                i += 1
                j += 1
            }
            if i==array.count || j==array.count { //应对最后一组 正好打印的情况
                break;
            }
            if array[i]%2 != 0{ //偶数不满足 ++
                i += 1
            }
            if array[j]%2 == 0{ //奇数不满足 ++
                j += 1
            }
        }
    }


}

