//
//  ShopCoupon.swift
//  huawei
//
//  Created by 王本东 on 2023/6/14.
//

import Foundation


class ShopCoupon: Any {
    
    //思路：图片中
    func goShoping(coupon : (Int,Int,Int) , man : Int , array : Array<Int>)
    {
        //可以是0张
        let manjian = coupon.0
        let dazhe = coupon.1
        let zhijian = coupon.2
        
        
        for money in array{
            var resultMoney = Int.max
            var bestCoupon = 0
            //1 先满减 再 打折
            var money1 = money
            var bestCoupon1 = 0
            money1 = money1 - (min(money/100, manjian) * 10) //满减
            bestCoupon1 = bestCoupon1 + min(money/100, manjian)
            if dazhe > 0 {
                money1 = Int(Double(money1) * 0.92)
                bestCoupon1 = bestCoupon1 + 1
            }
            resultMoney = min(money1, resultMoney)
            bestCoupon = bestCoupon1
            
            //2 先 打折 再满减
            var money2 = money
            var bestCoupon2 = 0
            if dazhe > 0 {
                money2 = Int(Double(money2) * 0.92)
                bestCoupon2 += 1
            }
            money2 = money2 - (min(money/100, manjian) * 10) //满减
            bestCoupon2 = bestCoupon2 + min(money/100, manjian)
            if money2 < resultMoney{
                resultMoney = money2
                bestCoupon = bestCoupon2
            }
            
            //3 先满减 再 直减
            var money3 = money
            var bestCoupon3 = 0
            money3 = money3 - (min(money/100, manjian) * 10) //满减
            bestCoupon3 = bestCoupon3 + min(money/100, manjian)
            money3 = money3 - zhijian * 5
            bestCoupon3 += zhijian
            if money3 < resultMoney{
                resultMoney = money3
                bestCoupon = bestCoupon3
            }
            
            //4 先打折 再 直减
            var money4 = money
            var bestCoupon4 = 0
            if dazhe > 0 {
                money4 = Int(Double(money4) * 0.92)
                bestCoupon4 += 1
            }
            money4 = money4 - zhijian * 5
            bestCoupon4 += zhijian
            if money4 < resultMoney{
                resultMoney = money4
                bestCoupon = bestCoupon4
            }
            
            print("\(resultMoney) \(bestCoupon)")
        }
        
    }
    
}
