//
//  ViewController.swift
//  BeiJing
//
//  Created by 王本东 on 2024/5/8.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        //MARK: 找出数组第二大的数字
//        print( "答案",findSecondNumber([1,3,6,7,5,7]))
//        print( "答案",findSecondNumber([1,6,2,5,6]))
        
        //MARK:  打印随机数
        printNumber([1,2,3,4,5,6,7,8,9,10])
    }

    //MARK: - 找出数组第二大的数字
    /*
     输入：1、3、6、7、5、7  输出： 6
     输入：1、6、2、5、6  输出 5
     */
    func findSecondNumber(_ array : Array<Int>) -> Int {
        var firstNumber = array[0]
        var secondNumber = firstNumber
        
        for index in 1..<array.count {
            let number = array[index]
//            print(index,number)
            
            if number>firstNumber{
                secondNumber = firstNumber
                firstNumber = number
            }
            else if number != firstNumber && number > secondNumber{
                secondNumber = number
            }
        }
        
        return secondNumber
    }
    
    //MARK: - 打印随机数
    /*
     1.随机乱序 2.不能重复 3.全部输出 不能遗漏
     4.容器只能选择数组
     */
    func printNumber(_ array:Array<Int>){
        let first = 0
        var last = array.count-1
        var changeArr = array
        
        while last >= 0 { //第二次循环范围就变小了
            let index = randomNumber(first, last)
            let value = changeArr[index]
//            print("随机位置：\(index)"
            print("数值：\(value)")
            
            //换位置
            let temp = changeArr[last] //最后的数字（已经 减1 了）
            changeArr[last] = value
            changeArr[index] = temp
            last -= 1
//            print(changeArr)
        }
    }
    
    //随机数
    func randomNumber(_ first:Int,_ last:Int) -> Int {
        return Int.random(in: first...last)
    }
}

