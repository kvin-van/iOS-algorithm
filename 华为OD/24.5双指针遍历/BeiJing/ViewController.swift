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
       
      print(  findValue("7","1 2 2 7 3 6 1","3"))
        print(  findValue("3","1 2 3","3"))
        print(  findValue("4","4 2 2 3","2"))
        print(  findValue("6","1 3 1 9 1 3","3")) //13
        print(  findValue("6","3 5 1 6 1 2","3")) //10
    }
    
    /*
     length 长的数组里面是数字
     有count次机会
     有前指针和后指针 只能按顺序从头取值或者从后取值
     算出可取的最大的值
     示例： "7","1 2 2 7 3 6 1","3"
     输出： 10  //一直选择右指针
     示例： "3","1 2 3","3"
     输出： 6
     示例： "4","4 2 2 3","2"
     输出： 7   选了左右
     */
    func  findValue(_ length:String,_ arrayStr:String,_ count:String) -> Int {
        var _ = Int(length)!
        var tempCount = Int(count) ?? 0
        let array = arrayStr.components(separatedBy: " ")
        
        var dic : Dictionary<Int,Array<Int>> = [:]
        var flag = 1
        
        var point1 = 0
        var point2 = array.count-1
        
        while tempCount > 0 {
            var tempArr:Array<Int> = []
            
            let value1 = array[point1]
            point1 = point1 + 1
            let value2 = array[point2]
            point2 = point2 - 1
            
            tempCount = tempCount - 1
            
            tempArr.append( Int(value1)!)
            tempArr.append( Int(value2)!)
            dic[flag] = tempArr
            flag = flag + 1
        }
        
        return getMaxValue(1,1, &dic,dic[1]!, Int(count)!)
    }
    
    //动态规划 + 递归
    func getMaxValue(_ leftFlag: Int,_ rightFlag:Int , _ dictionary: inout Dictionary<Int,Array<Int>>,_ valueArr : Array<Int>,_ count: Int) -> Int {
        var ans1 = 0
        var ans2 = 0
        
        if count == 1{
            return max(valueArr[0], valueArr[1])
        }
        
        ans1 = valueArr[0] + getMaxValue(leftFlag+1,rightFlag, &dictionary, [dictionary[leftFlag+1]![0],dictionary[rightFlag]![1]], count-1)
        ans2 = valueArr[1] + getMaxValue(leftFlag,rightFlag+1, &dictionary, [dictionary[leftFlag]![0],dictionary[rightFlag+1]![1]], count-1)
        
        return max(ans1, ans2)
    }
    
}

