//
//  ViewController.swift
//  SuanFa
//
//  Created by 王本东 on 2021/3/8.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //8位截取
        _ = self.addEightAction(string: "123456")
        
        //打印二进制整数
        _ = self.printIntNumber(no: 1)
        _ = self.printIntNumber(no: 2)
        _ = self.printIntNumber(no: 3)
        _ = self.printIntNumber(no: 4)
        _ = self.printIntNumber(no: 5)
        _ = self.printIntNumber(no: 6)
        
        // 局部最小值问题
        let yuanzu = self.minValue(sortArr: [4,3,6,8,2,1,5,7])
        print(yuanzu == nil ? "空":"\(yuanzu!)")
    }

    // MARK: -  8位截取
    /*输入一个字符串，请按长度为8拆分每个输入字符串并进行输出；
    长度不是8整数倍的字符串请在后面补数字0，空字符串不处理。
     输入：  abc
     输出： abc00000
     */
    func addEightAction(string : String) -> String{
        if string.isEmpty{
            return ""
        }
        
        let end = string.count%8 == 0 ? string.count/8 : string.count/8+1
        for i in 1...end {
            if(i * 8 < string.count){//多了
                print("\(string.dropLast(string.count - i*8).dropFirst((i-1)*8).prefix(8))") //后面去掉多的   减去前面输出过了的 + 8位     //prefix（8）意思是 从0 开始8 位
            }
            else if (i * 8 == string.count){//正好
                print("\(string.dropLast(string.count - i*8).dropFirst((i-1)*8))")
            }
            else if (i * 8 > string.count){//不够
                let zero = "00000000"
                let head = string.dropFirst((i-1)*8).prefix(string.count - (i-1)*8)  //前面去掉输出过的 加上点剩余
                print("\(head + zero.suffix(i*8-string.count))")  //补0
            }
        }
        return ""
    }
    
    // MARK: -  打印二进制整数   关键点 先取余再除2
    func printIntNumber(no : Int) -> String
    {
        if no == 0{
            print("二进制：00")
            return "00"
        }
        if no == 1{
            print("二进制：01")
            return"01"
        }
        
        var i = no
        var string : String = ""
        while i>0{
            let last = String(i%2)  //取余
            i = i/2   //关键 十进制转二进制就是不断的除2
            string.insert(contentsOf: last, at: string.startIndex)
        }
        
        print("\(no)二进制: \(string)")
        return string
    }
    
    // MARK: -  局部最小值问题
    /*
     无序数组，任意两个相邻的数不等，找到存在局部最小的位置
     0位置比1位置小，则0位置是局部最小，n-2位置比n-1位置小，返回n-1位置
     中间位置i，需满足 i 比左边小也比右边小，则i位置是局部最小
     局部最小位置存在即可返回，不用返回所有的位置
     */
    func minValue(sortArr : [Int]) ->(Int,Int)?
    {
        if sortArr.count<2{
            return nil
        }
        
        var left : Int = 0
        var right : Int = sortArr.count-1
        
        if sortArr[0] < sortArr[1]{
            return(0,sortArr[0])
        }
        else if sortArr[sortArr.count-2] > sortArr[sortArr.count-1]{
            return(sortArr.count-1, sortArr[sortArr.count-1])
        }
        var mid : Int
        while left < right{
            mid = left + (right - left) / 2 //容易写错 成（right/2）
            if sortArr[mid] > sortArr[mid - 1] {
                            right = mid;
            } else if sortArr[mid] > sortArr[mid + 1] {  //只会进入一个  if
                            left = mid + 1;
            } else {
                return (mid , sortArr[mid]);
            }
        }
        return nil
    }
    
}

