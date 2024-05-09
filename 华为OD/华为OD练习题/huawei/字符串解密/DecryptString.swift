//
//  DecryptString.swift
//  huawei
//
//  Created by 王本东 on 2023/6/15.
//

import Foundation


class DecryptString: Any {
    //1.输入2个字符串  删除干扰串 并去重 形成新字符串数组
    //2.字符串2去重后 得新数组
    //3.遍历字符1数组 字符长度大于字符2的值都舍弃  寻找字符小于等于字符2数组的值(越接近字符2数组的count越好)  如果有2个 取字符1数组靠后的值
    
    func decryptString(_ string1 : String,_ string2 : String) -> String {
        var str1Arr : Array<String> = []
        var tempStr = ""
        for chat in string1{ //Character
            if chat >= "g" && chat <= "z" {
                tempStr.append(chat)
            }
            else{
                if tempStr.count > 0 {
                    str1Arr.append(tempStr)
                }
                tempStr = ""
            }
        }
        if tempStr.count > 0 { //末尾都是符合 g--z的
            str1Arr.append(tempStr)
        }
        print(str1Arr)
        
        let str2Arr = Array(Set(string2))
        
        var resultStr = ""
        for str in str1Arr{
            if str.count > str2Arr.count{
                continue
            }
            else{//都是小于等于字符2数组count的了
                if str.count >= resultStr.count{ //越大越接近 字符2数组count   等于 属于最后也留下
                    resultStr = str
                }
            }
        }
        if resultStr.count == 0{
            resultStr = "Not Found"
        }
        return resultStr
    }
    
}
