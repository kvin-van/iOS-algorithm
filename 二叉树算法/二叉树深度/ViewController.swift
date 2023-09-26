//
//  ViewController.swift
//  二叉树深度
//
//  Created by 王本东 on 19/05/2022.
//

import UIKit
//二叉树
public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init(_ val: Int) {
        self.val = val
        self.left = nil
         self.right = nil
     }
 }


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let  one = TreeNode(1);
        let  two = TreeNode(2);
        let  three = TreeNode(3);
        let  four = TreeNode(4);
        let  five = TreeNode(5);
        let  six = TreeNode(6);
        let  seven = TreeNode(7);
        one.left = two  ; one.right = three
        two.left = four ; two.right = five
        three.right = six ; three.left = nil
        five.left = seven
        /*
                1
           2      3
         4  5  nil 6
            7 nil
         */
        
        //递归方法内 仍然有只一个返回值。
//        let x : Int = self.maxDepth(one)//深度
//        print(x)
        
//        let mirror = self.Mirror(one)//镜像
//        print(mirror ?? (Any).self)
        
        let result :TreeNode = self.lowestCommon(one, 4, 7)//算最低的共同节点
        print(result.val)
        let result2 = self.lowestCommonAncestor(one, 4, 7)//算最低的共同节点
        print(result2)
    }

    // MARK: - 二叉树深度
//  理解：先算 4的左右返回00  然后是7的左右返回 00  然后是5的左右 返回 10 然后是2的左右返回时 12
    // 二叉树深度     倒序返回0+1
    func maxDepth(_ root: TreeNode?) -> Int {
            
            if root != nil {
//                print(" 值 :\(root!.val)")
                let maxleft : Int = maxDepth(root!.left),
                maxright = maxDepth(root!.right)
//                print(" 深度 :\(maxleft) ,\(maxright) ")
//                print(max(maxleft, maxright) + 1)
                return max(maxleft, maxright) + 1
            }
            return 0
        }
    
    // MARK: -  Mirror 镜子  二叉树镜像
    //思路 递归置换
    func Mirror ( _ pRoot: TreeNode?) -> TreeNode? {
        if (pRoot != nil){
            pRoot?.left = self.Mirror(pRoot!.left)
            pRoot?.right = self.Mirror(pRoot!.right)
            
            let temp = pRoot!.left ?? nil
            pRoot!.left = pRoot!.right ?? nil
            pRoot!.right = temp
        }
        return pRoot
    }
    
    // MARK: -  最低的 共同 节点（祖先）
    //方法1 找值 把路径相加 然后倒序搜索
    func lowestCommonAncestor ( _ root: TreeNode?,  _ one: Int,  _ two: Int) -> Int {
        var arrayOne : Array<TreeNode> = [] , arrayTwo : Array<TreeNode> = []
            let value = 0
        arrayOne.append(root!)
        arrayTwo.append(root!)
        arrayOne = self.searchValue(array: arrayOne, val: one, node: root!)
        arrayTwo = self.searchValue(array: arrayTwo, val: two, node: root!)
//        print(" 路径1 :\(arrayOne)")
//        print(" 路径2 :\(arrayTwo)")
        for index  in (0 ..< arrayOne.count).reversed(){
            let node : TreeNode = arrayOne[index]
            for index2  in (0 ..< arrayTwo.count).reversed(){
                let node2 : TreeNode = arrayTwo[index2]
                if(node.val == node2.val){
                    return node.val
                }
            }
        }
        return value
        }
    
    func searchValue( array : Array<TreeNode> , val : Int , node : TreeNode) -> Array<TreeNode> {
        if(node.val == 0){
            return []
        }
        var tempArr = array
        tempArr.append(node)
        if(node.left?.val == val || node.right?.val == val){
            return tempArr;
        }
        
        let array1 = self.searchValue(array: tempArr, val: val, node: node.left ?? TreeNode (0))
        let array2 = self.searchValue(array: tempArr, val: val, node: node.right ?? TreeNode(0))
        
        return array1.count > array2.count ? array1:array2
    }
    
    //方法2 ：递归 算最低的共同节点
    func lowestCommon( _ root: TreeNode?,  _ one: Int,  _ two: Int) -> TreeNode {
        if((root == nil)){
                return TreeNode(0)
        }
        if(root?.val == one || root?.val == two){
            print("等于= \(root!.val)")
            return root!
        }
            
        let leftNode : TreeNode = self.lowestCommon(root!.left, one, two)
        let rightNode : TreeNode = self.lowestCommon(root!.right, one, two)
        
        if (leftNode.val == 0){
            print("左空了= \(rightNode.val)")
            return rightNode
        }
        if (rightNode.val == 0){
            print("右空了= \(leftNode.val)")
            return leftNode
        }
            
        return root!
        }
}

