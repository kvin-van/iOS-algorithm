//
//  Currency.swift
//  huawei
//
//  Created by 王本东 on 2023/6/12.
//

import Foundation


class Currency: Any {
    
    let currencyDic : Dictionary<String, Double> = ["CNY": 1.00 ,"JPY" : 18.250,"HKD":1.230,"EUR":0.140,"GBP":0.120]
    func currencyAction(_ array : Array<String>) -> Int {
        var ans = 0
        for var str in array{
            if str.contains("CNY") || str.contains("fen"){ //人民币
                if str.contains("CNY"){
                    let tempStr = str.components(separatedBy: "CNY")[0]
                    ans = ans + Int(tempStr)! * 100
                    str = str.replacingOccurrences(of: tempStr, with: "")
                    str = str.replacingOccurrences(of: "CNY", with: "")
                }
                if str.contains("fen"){
                    str = str.replacingOccurrences(of: "fen", with: "")
                    ans = ans + Int(str)!
                }
            }else if str.contains("JPY") || str.contains("sen"){//日元
                var tempJPY = 0
                if str.contains("JPY"){
                    let tempStr = str.components(separatedBy: "JPY")[0]
                    tempJPY = tempJPY + Int(tempStr)! * 100
                    str = str.replacingOccurrences(of: tempStr, with: "")
                    str = str.replacingOccurrences(of: "JPY", with: "")
                }
                if str.contains("sen"){
                    str = str.replacingOccurrences(of: "sen", with: "")
                    tempJPY = tempJPY + Int(str)!
                }
                ans = ans + Int(Double(tempJPY) / currencyDic["JPY"]!)//结汇
            }
            else if str.contains("HKD") || str.contains("cents"){  //港元
                var tempHKD = 0
                if str.contains("HKD"){
                    let tempStr = str.components(separatedBy: "HKD")[0]
                    tempHKD = tempHKD + Int(tempStr)! * 100
                }
                if str.contains("cents"){
                    str = str.replacingOccurrences(of: "cents", with: "")
                    if let rang = str.range(of: "HKD"){
                        str = String(str[rang.upperBound..<str.endIndex])
//                        tempStr = tempStr.substring(from: rang.upperBound)  //HKD后面的
                    }
                    tempHKD = tempHKD + Int(str)!
                }
                ans = ans + Int(Double(tempHKD) / currencyDic["HKD"]!)//结汇
            }
            else if str.contains("EUR") || str.contains("eurocents"){ //欧元
                var tempEUR = 0
                if str.contains("EUR"){
                    let tempStr = str.components(separatedBy: "EUR")[0]
                    tempEUR = tempEUR + Int(tempStr)! * 100
                    str = str.replacingOccurrences(of: tempStr, with: "")
                    str = str.replacingOccurrences(of: "EUR", with: "")
                }
                if str.contains("eurocents"){
                    str = str.replacingOccurrences(of: "eurocents", with: "")
                    tempEUR = tempEUR + Int(str)!
                }
                ans = ans + Int(Double(tempEUR) / currencyDic["EUR"]!)//结汇
            }
            else if str.contains("GBP") || str.contains("pence"){  //英镑
                var tempGBP = 0
                if str.contains("GBP"){
                    let tempStr = str.components(separatedBy: "GBP")[0]
                    tempGBP = tempGBP + Int(tempStr)! * 100
                }
                if str.contains("pence"){
                    str = str.replacingOccurrences(of: "pence", with: "")
                    if let rang = str.range(of: "GBP"){
                        str = String(str[rang.upperBound...str.endIndex])
                    }
                    tempGBP = tempGBP + Int(str)!
                }
                ans = ans + Int(Double(tempGBP) / currencyDic["GBP"]!)//结汇
            }
            
        }
        
        return ans
    }
}
