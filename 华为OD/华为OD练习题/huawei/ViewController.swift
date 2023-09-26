//
//  ViewController.swift
//  huawei
//
//  Created by 王本东 on 2023/6/6.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //最长公共子字符串
//        var text1 = "hello123abc4"
//        var text2 = "hello123world"
//       print( longCommonSubstring(text1, text2))
//         text1 = "private_void_method"
//         text2 = "public_void_method"
//       print( longCommonSubstring(text1, text2))
//        var res = ""
//                for i in 0..<text1.count-1 {//暴力循环
//                    for j in (i+1)...text1.count {
//                        let tmp = text1.dropFirst(i).prefix(j-i)
//                        if text2.contains(tmp) && tmp.count > res.count {
//                            res = String(tmp)
//                        }
//                    }
//                }
//                print(res)
        
        //华为OD木板补齐
//        print("木板:\(boardAdd(5, 3, [4,5,3,5,5]))")
//        print("木板:\(boardAdd(5, 2, [4,5,3,5,5]))")
        
        //华为OD 单词倒排
//        print("\(sortString("student a am I"))")
//        print("\(sortString("$bo*y gi!r#l"))")
        
        //华为OD
//        let find : FindValue = FindValue()
//        print("\(find.findValue(array:  [[0,3,5,4,2], [2,5,7,8,3], [2,5,4,2,4]]))")
//        print("\(find.findValue2(array:  [[0,3,5,4,2], [2,5,7,8,3], [2,5,4,2,4]]))") //方法2理解方便
        
        //华为OD  单入口空闲区域  方法2 更容易理解 ⚠️难
//        let intoArr =  IntoArray()
//        print("\(intoArr.findEntrance(4, 4, [["X","X","X","X"],["X","O","O","X"],["X","O","O","X"],["X","O","X","X"]]))")
//        print("\(intoArr.findEntrance(4, 5, [["X","X","X","X","X"],["O","O","O","O","X"],["X","O","O","O","X"],["X","O","X","X","O"]]))")
//        print("\(intoArr.findEntrance(5, 4, [["X","X","X","X"],["X","O","O","O"],["X","O","O","O"],["X","O","O","X"],["X","X","X","X"]]))")
//        print("\(intoArr.findEntrance(5, 4,[["X","X","X","X"],["X","O","O","O"],["X","X","X","X"],["X","O","O","O"],["X","X","X","X"]]))")
//        print("\(intoArr.findEntrance2(4, 4, [["X","X","X","X"],["X","O","O","X"],["X","O","O","X"],["X","O","X","X"]]))")
//        print("\(intoArr.findEntrance2(4, 5, [["X","X","X","X","X"],["O","O","O","O","X"],["X","O","O","O","X"],["X","O","X","X","O"]]))")
//        print("\(intoArr.findEntrance2(5, 4, [["X","X","X","X"],["X","O","O","O"],["X","O","O","O"],["X","O","O","X"],["X","X","X","X"]]))")
//        print("\(intoArr.findEntrance2(5, 4,[["X","X","X","X"],["X","O","O","O"],["X","X","X","X"],["X","O","O","O"],["X","X","X","X"]]))")
        
        //华为OD  货币计算
//        let currency = Currency()
//        print("\(currency.currencyAction(["100CNY"]))") // 10000
//        print("\(currency.currencyAction(["3000fen"]))") // 3000
//        print("\(currency.currencyAction(["123HKD"] ))") // 10000
//        print("\(currency.currencyAction(["20CNY53fen", "53HKD87cents"]))") // 6432
        
        //华为OD单词倒序
//       print("\(overturn("yM eman si boB ? I ma enif."))")
        
        //华为OD对称字符串  ⚠️难
//        let searchChat = SearchChat()
//        print("\(searchChat.searchChatAction((1,0)))")
//        print("\(searchChat.searchChatAction((2,1)))")
//        print("\(searchChat.searchChatAction((3,2)))")
//        print("\(searchChat.searchChatAction((4,6)))")
//        print("\(searchChat.searchChatAction((5,8)))")
//        print("\(searchChat.searchChatAction((64,73709551616)))")
        
        //华为OD 分界线
//         hw_lines(line1: "ab cd", line2: "ab")
//        hw_lines(line1: "ab ef", line2: "aef")
//        hw_lines(line1: "ab bcd ef", line2: "cbd fe")
//        hw_lines(line1: "ab bcd ef", line2: "cd ef")
        
        //华为OD 关联端口组合并
//        let  aboutPort = AboutPort()
//        print("\(aboutPort.aboutPort(4, [[4],[2,3,2],[1,2],[5]]))")
//        print("\(aboutPort.aboutPort(3, [[2,3,1],[4,3,2],[5]]))")
//        print("\(aboutPort.aboutPort(6, [[10],[4,2,1],[9],[3,6,9,2],[6,3,4],[8]]))")
//        print("\(aboutPort.aboutPort(11,[[]]))")
        
        //华为OD 日志采集
//        let logsUpload = LogsUpload()
//        print("\(logsUpload.logUpload([1,98,1]))")
//        print("\(logsUpload.logUpload([50,60,1]))")
//        print("\(logsUpload.logUpload([1,2,97]))")
        
        //华为OD 通信误码
//        let hashErrorCode = HashErrorCode()
//        print("\(hashErrorCode.findErrrorCodeLengh([1,2,2,4,1]))")
//        print("\(hashErrorCode.findErrrorCodeLengh([1,2,2,4,2,1,1]))")
        
        //华为OD 商城优惠券 ⚠️难
//        let shop = ShopCoupon()
//        shop.goShoping(coupon: (3,2,5), man: 3, array: [100,200,400])
        
        //华为OD 字符串解密
//        let decryptStr = DecryptString()
//        print(decryptStr.decryptString("thisisanewday111forme", "good"))
//        print(decryptStr.decryptString("123admyffc79pt", "ssyy"))
//        print(decryptStr.decryptString("123admyffc79ptaagghi2222smeersst88mnrt", "ssyyfgh"))
//        print(decryptStr.decryptString("abcmnq", "rt"))
        
        //华为OD 整理扑克牌   ⚠️难
//        let pokerSort = PokerSort()
//        pokerSort.pokerSort([1,3,3,3,2,1,5])
//        pokerSort.pokerSort([4,4,2,1,2,1,3,3,3,4])
//        pokerSort.pokerSort([9,3,4,4,5,5,1,1,1,6,6,6,7,7,7,8,8,8,8,2,2,2,2,2])
        
        
        //HJ107 求解立方根
//        let num1 = self.cubeRoot(27)
//        print(String(format: "%.1f", num1))
//        print(String(format: "%.1f", self.cubeRoot(19.9)))
//        let num2 = self.cubeRoot(2.7)
//        print(String(format: "%.1f", num2))
        
        //HJ6 质数因子
//        print("\(primeNumber(180))")
//        print("\(primeNumber(392))")
//        print("\(primeNumber(195))")
        
        //华为OD 箱子之形摆放
        // 来回摇摆位输出
//        let box = BoxPlacement()
//        box.placementBox2("ABCDEFG", 3)
//        box.placementBox("ABCDEFG", 3)

    }
    
    //MARK: - 最长公共子字符串
    func longCommonSubstring(_ text1 : String , _ text2 : String) -> String {
        var str1 = ""
        var str2 = ""
        if text1.count > text2.count {
            str1 = text2
            str2 = text1
        }else{
            str1 = text1
            str2 = text2
        }
        
        var ans : String = ""
        var lengh  = 1
        for i in 0..<str1.count{
            var sub1 = str1.dropFirst(i).prefix(1)
            for j in 0..<str2.count{
                var sub2 = str2.dropFirst(j).prefix(1)
                if sub1 == sub2{
                    while sub1 == sub2 {
                        ans = sub2.count > ans.count ? String(sub2) : ans
                        lengh = lengh + 1
                        if lengh > str1.count - i{ //dropFirst(max) max 和 str1.count 相等 所以没有+1
                            break
                        }
                        sub1 = str1.dropFirst(i).prefix(lengh)
                        sub2 = str2.dropFirst(j).prefix(lengh)
                    }
                    lengh = 1
                }
            }
        }
        
        return ans
    }
    
    
    //MARK: - 华为OD木板补齐
    // n 木板数组的个数  board 木材   array 木板数组   将木材board 减为0  增加木板数组的平均长度。补完后  输出最短那个木板
    //思路 数组先排序 然后补齐 循环后移
    /*
     示例1：
     5 3
     4 5 3 5 5
     输出 5
     
     示例2：
     5 2
     4 5 3 5 5
     输出 4
     */
    func boardAdd(_ n : Int ,_ board : Int , _ array : Array<Int>) -> Int
    {
//        let array2 = array.sorted() // 等于冒泡
//        print(array2)
        
        //冒泡
        var array2 = array
        for i in 0...array2.count-2{
            let a = array2[i]
            let x = i+1
            for j in x...array2.count - 1{
                let b = array2[j]
                if a > b {
                    let temp = a
                    array2[i] = b
                    array2[j] = temp
                }
            }
        }
//        print(array2)
        
        var tempBoard = board
        while(tempBoard > 0){
            var a = array2[0]
            a = a + 1
            array2[0] = a
            var b = array2[1]
            
            var index = 0
            while a>b{
                array2[index] = b
                array2[index+1] = a
                
                index = index+1
                
                a = array2[index]
                b = array2[index+1]
            }
//            print(array2)
            tempBoard = tempBoard - 1
        }
        return array2[0]
    }
    
    //MARK: - 华为OD单词倒排
    /*
     let myString = "Hello123"  // 初始化字符串
     let myCharacters = Array(myString)  // 将字符串转化为字符数组
     var myLetters = [Character]()  // 初始化空的字符数组
     var myDigits = [Character]()  // 初始化空的字符数组
     // 循环遍历字符串中的每一个字符
     for character in myCharacters {
         if character.isLetter {  // 判断是否是字母
             myLetters.append(character)  // 将字母添加到 myLetters 数组中
         } else if character.isNumber {  // 判断是否是数字
             myDigits.append(character)  // 将数字添加到 myDigits 数组中
         }
     }
     
     let line = "$bo*y gi!r#l"
     let regux = try! NSRegularExpression(pattern: "[^a-zA-Z]")
     let res = regux.stringByReplacingMatches(in: line, range: NSMakeRange(0, line.count), withTemplate: " ")
     let array = res.split(separator: " ")
     for i in (0..<array.count).reversed() {
         print(array[i], terminator: " ")
     }
     
     */
    func sortString(_ string : String) -> String {
        var array : Array = Array(string)
        array.append(" ")
        var array2 : Array<String> = []
        
        var str : String = ""
        for item in array {
            if item.isLetter {
                str = str + String(item);
            }
            else if item.isNumber {
                str = str + String(item);
            }
            else{ // 不是字母也不是数组
                if str.count>0 {
                    array2.insert(str, at: 0) //将拼接的单词 插在最前面 实现倒排
                    str = ""
                }
            }
        }
        
        //循环结束
        print(array2)
        var ans = ""
        for indexStr in array2{
//            print(indexStr)
            ans = ans + indexStr + " "
        }
    return ans
    }
    

    
    
    
//MARK: - HJ107 求解立方根
    func cubeRoot(_ num: Double) -> Double {
        var ans : Double = num
        if ans < 0 {
            ans = ans * -1
        }
        
        for i in stride(from: 0.0, to: ans, by: 0.01){
            if i * i * i > num{
                break
            }
            ans = i
        }
        
        return ans
    }
    
    //MARK: - HJ6 质数因子
    func primeNumber(_ n : Int) -> [Int] {
        var  tempN = n
        var array : Array<Int> = []
        for x in  2...n{ //为什么没有先把质数跳出来在循环呢？  因为如果不是质数肯定 前面的2或3什么的已经把它整除了。所以这里不用考虑 过滤质数 的问题
            while tempN % x == 0 {
                    array.append(x)
                    tempN  = tempN/x
            }
        }
        
        return array
    }
    
    //MARK: - 华为OD单词翻转
    func overturn(_ string : String)-> String
    {
        var ans = ""
        let arr = string.components(separatedBy: " ")
        for var str in arr
        {
            if str.contains("."){
                str = str.replacingOccurrences(of: ".", with: "")
                str = String(str.reversed())
                str.append(".")
            }
            else{
                str = String(str.reversed())
            }
            ans = ans + str + " "
        }
        
        return ans
    }
    //方法2
    func overturn2(_ string : String) -> String
    {
        var str1 = string.replacingOccurrences(of: ",", with: " , ")
         str1 = str1.replacingOccurrences(of: ".", with: " . ")
         str1 = str1.replacingOccurrences(of: "?", with: " ? ")
        var array = str1.components(separatedBy: " ")
        print(array)
        for i in  (0..<array.count).reversed(){
            let chat = array[i]
            if chat.count<1{
                array.remove(at: i)
            }
        }
        print(array)
        var  ans = ""
        for str in array{
            let tempStr = str.reversed()
            if str == "."{
                if let _ = ans.popLast() { //弹出最后一个空格字符
                    ans = ans + str
                }
            }else{
                ans = ans + tempStr + " "
            }
        }
        
        return ans
    }
    
    //MARK: - 华为OD报纸 匿名信 分界线
    //给定2个字符串  用空格分割成数组  数组1 是否包含数组2 字母的顺序可以乱序
    // 测试用例
//        let line1 = "ab cd"  line2 = "ab"
    //true
//        let line1 = "ab ef", line2 = "aef"
    //false
//        let line1 = "ab bcd ef", line2 = "cbd fe"
    //true
//        let line1 = "ab bcd ef", line2 = "cd fe"
    //false  长度必须一只
    func hw_lines( line1 : String , line2 : String)
    {
        // 将字符串使用空格拆分成数组
        var newsArr = line1.components(separatedBy: " ")
        var anonyArr = line2.components(separatedBy: " ")
        // 对数组中的每个元素进行字符排序
        newsArr = newsArr.map { String($0.sorted()) }
        anonyArr = anonyArr.map { String($0.sorted()) }
        var res = false
        // 对匿名数组anonyArr进行遍历
        for i in anonyArr {
            // 如果匿名数组anonyArr中的元素全部都在报纸数组中包含则给将结果置为true，反之false
            if newsArr.contains(i) {
                res = true
            }else {
                res = false
                break
            }
        }
        print(res ? "true" : "false")
    }
   
    


}
