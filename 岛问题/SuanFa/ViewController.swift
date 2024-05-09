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
        
//        //岛屿问题
        let islands = [[1,0,0,1],[1,0,0,1],[1,1,1,1]] as NSMutableArray
        let num = self.numIslands(grid: islands)
        print("岛数量：\(num)")
        
    }
    
    
    // MARK: -  岛问题
    /*
     连续的1 为一个岛 递归判断上下左右
     输入：   [[1,0,0,1],[1,0,0,0],[0,0,1,1]]
     输出： 3
     思路： 找出1 然后直接带入函数 （1、越界返回   2、是0 返回  3、是1变0    4、上下左右 ）
     */
    func numIslands(grid : NSMutableArray) -> Int
    {
        var result  : Int = 0
        for i  in 0...grid.count-1  {  //i 是列
            let lie = grid[i] as! Array<Int>
            for j in 0...lie.count-1 {
                let value  = grid[i]  as! Array<Int>
                if value[j] == 1 { //有陆地了
                    result += 1
                    dfs(grid: grid, i: i, j: j)
                }
            }
        }
        return result
    }

    // 从（i, j)开始，将与之相邻的陆地都变成海水
    func dfs( grid :NSMutableArray, i : Int, j : Int) {
        // 超出索引边界
        if i < 0 || j < 0 {
            return
        }
        if i >= grid.count || j >= (grid[i] as! Array<Int>).count {
            return
        }
        // 已经是海水了
        var value0  = grid[i]  as! Array<Int>
        if  value0[j] == 0 {
            return
        }
        
//        将 (i, j) 变成海水
        value0[j] = 0
        grid.replaceObject(at: i, with: value0)
        print("位置\(i)\(j)")
        
        // 淹没上下左右的陆地
        dfs(grid: grid, i: i-1, j: j)
        dfs(grid: grid, i: i+1, j: j)
        dfs(grid: grid, i: i, j: j-1)
        dfs(grid: grid, i: i, j: j+1)
    }
    

    
}

