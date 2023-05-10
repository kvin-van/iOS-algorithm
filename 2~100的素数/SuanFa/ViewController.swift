//
//  ViewController.swift
//  SuanFa
//
//  Created by 王本东 on 2023/5/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let array = self.primeNumber(100)
        print(array)
    }

    //从2到100中,有25个素数,它们是： 2,3,5,7,11,13 17,19,23,29,31,37  41,43,47,53,59,61  67,71,73,79,83,89  97
    //素数就是质数，有无限个。除了1和该数本身以外不再有其他的因数的数被称为素数
    func primeNumber(_ number : Int) -> Array<Int>
    {
        var array : Array<Int> = []
        
        for x in 2...100{
            //优化
            if x > 9 && (x%2 == 0 || x%5 == 0) {
                continue
            }
            
            for y in 2...x {
                if x%y == 0 && x != y {
                    break;
                }
                if y == x{
                    array.append(y)
                }
            }
        }
        
        return array
    }

}

