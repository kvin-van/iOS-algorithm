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
       
      print(  findValue("1-2abcd"))
        print(  findValue("1-2ab2+1*10"))
    }
    
    /*  题目：
     提取字符串中的最长合法简单数学表达式，字符串长度最长的，并计算表达式的值。如果没有，则返回0
    简单数学表达式只能包含以下内容
    0-9数字，符号+-*
    说明:
    1.所有数字，计算结果都不超过long
    2.如果有多个长度一样的，请返回第一个表达式的结果
    3.数学表达式，必须是最长的，合法的
    4.操作符不能连续出现，如+--+1是不合法的*/
    //⚠️ 通过率2%  提示数组越界或者内存溢出  不知道哪里出了问题。（可能没有排出 +--+1）
    func findValue(_ string : String) -> Int
    {
        var ansArr : Array<Array<String>> =  []
        var tempArr:Array<String> = [] //表达式数组
        var tempStr = ""
        for chat in string{
            if chat.isNumber{
                tempStr = tempStr + String(chat)
            }
            else if chat == "+"  || chat == "-" || chat == "*"{
                if tempStr.count>0{
                    tempArr.append(tempStr)
                    tempStr = ""
                    tempArr.append(String(chat))
                }
            }
            else{
                if tempStr.count>0{
                    tempArr.append(tempStr)
                    tempStr = ""
                }
                
                if tempArr.count>0{
                    ansArr.append(tempArr)
                    tempArr = []
                }
            }
        }
        
        if tempStr.count>0{
            tempArr.append(tempStr)
            tempStr = ""
        }
        if tempArr.count>0{
            ansArr.append(tempArr)
            tempArr = []
        }
        
        if ansArr.count<1{
            return 0
        }
        
        var array : Array<String> = [] //最长计算式
        for iArr in ansArr{
            if iArr.count > array.count{
                array = iArr
            }
        }
        
        while  array.contains("*"){
            guard   let index = array.firstIndex(of: "*") else{ return 0 }
            let tempAns = jisuan(array[index-1], array[index+1], array[index])
            array.remove(at: index+1)
            array.remove(at: index)
            array.remove(at: index-1)
            
            array.insert(String(tempAns), at: index-1)
        }
        
        while  array.contains("+"){
            guard   let index = array.firstIndex(of: "+") else{return 0 }
            let tempAns = jisuan(array[index-1], array[index+1], array[index])
            array.remove(at: index+1)
            array.remove(at: index)
            array.remove(at: index-1)
            
            array.insert(String(tempAns), at: index-1)
        }
        
        while  array.contains("-"){
            guard   let index = array.firstIndex(of: "-") else{return 0 }
            let tempAns = jisuan(array[index-1], array[index+1], array[index])
            array.remove(at: index+1)
            array.remove(at: index)
            array.remove(at: index-1)
            
            array.insert(String(tempAns), at: index-1)
        }
        
        if array.count == 1{
            return Int(array[0])!
        }else{
//            print("异常")
            return 0
        }
                
    }
    
    func jisuan(_ str1:String, _ str2:String,_ type: String) -> Int{
        if type == "+"{
            return Int(str1)! + Int(str2)!
        }
        else if type == "-"{
            return Int(str1)! - Int(str2)!
        }else if type == "*"{
            return Int(str1)! * Int(str2)!
        }
        
        return 0
    }
    
    
}

