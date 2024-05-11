//
//  ViewController.swift
//  lianxi
//
//  Created by 王本东 on 2023/9/8.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findSubString("abc", "efghicabiii")
        findSubString("abc", "efghicaibii")
    }
    /*
     题目：给定2个字符串string1  string2  判断字符串string2顺序子串  是否包含string1（string1 乱序也允许）
     返回 最初下标
     "abc", "efghicabiii" string2   cab顺序包含 string1  返回c下标 5
     "abc", "efghicaibii" 不包含    返回 -1
     */
    func  findSubString(_ string1 : String , _ string2: String) -> Void {
        var ans = -1
        for index in 0..<string2.count-1{
            if ans>=0{
                break
            }
            
            let letter = string2.dropFirst(index).prefix(1)
//            print(letter)
            if string1.contains(letter){
                for i in 1...string1.count-1{ //循环剩下的长度，看看接下来的每个字符都包含
                    let letter2 = string2.dropFirst(index+i).prefix(1)
                    if string1.contains(letter2){
                        if i == string1.count-1{
                            ans = index
                        }
                    }else{
                        break
                    }
                }
            }
        }
        
        print(ans)
    }

    
}


