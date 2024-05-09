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
        
//        let result :TreeNode = self.lowestCommon(one, 4, 7)//算最低的共同节点
//        print(result.val)
        let result2 = self.lowestCommonAncestor(one, 4, 7)//算最低的共同节点
        print(result2)
        
        // 二叉树从下至上遍历 （字符串形态）
//        runloopTreeNode("1(2(3(4,5)),6(7,8(9,10)))");
//        runloopTreeNode("1(2(3(4,5)),6(7,8(9,10(12,13),11(14,15))),16(17))");
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
        print(" 路径1 :\(arrayOne)")
        print(" 路径2 :\(arrayTwo)")
        for index  in (0 ..< arrayOne.count).reversed(){
            let node : TreeNode = arrayOne[index]
            for index2  in (0 ..< arrayTwo.count).reversed(){
                let node2 : TreeNode = arrayTwo[index2]
                print("\(node.val ) & \(node2.val)")
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
    
    // MARK: - 二叉树从下至上遍历 （字符串形态）
    /*
     【样例输入】
     1(2(3(4,5)),6(7,8(9,10)))，字符串内没有空格
     【样例输出】
     4 5 9 10
     3 7 8
     2 6
     1
     输出:4 5 9 10 3 7 8 2 6 1
     */
    func runloopTreeNode(_ string:String)-> Void
    {
        var myString = string;
        var resultArr:Array<(Int,Array<String>)> = [];
        while myString.count>0 {
            let value = backDeepAndValue(&myString);
//            print("深度和内容",value)
//            print("更新字符串",myString)
            if(resultArr.count == 0){
                resultArr.append(value)
                continue
            }
            for (index,tuple) in resultArr.enumerated(){ //按深度插入
                if value.0 > tuple.0{
                    resultArr.insert(value, at: index)
                    break;
                }
                else if tuple.0 == value.0{
                    if index == resultArr.count-1{
                        resultArr.append(value)
                    }else{
                        continue
                    }
                }
                if index == resultArr.count-1{ // 最后
                    resultArr.append(value)
                }
            }
//            print("resultArr:",resultArr);
        }
        var printArr:Array<String> = []
        for tuple in resultArr{
            printArr.append(contentsOf: tuple.1);
        }
        print(printArr); //结果输出
    }
    
    //返回深度和字符串数组
    func backDeepAndValue(_ string: inout String)->(Int,Array<String>){
        var tree:(deep:Int,value:Array<String>) = (deep:0,value:[]);
        
        if(string.count<=1){
            tree.deep = 0;
            tree.value = [string];
            string = "";
            return tree
        }
        
        var start = 0
        for (index,chat) in string.enumerated(){
            if(chat == "("){
                tree.deep += 1
                start = index
            }else if chat == ")"{
                let startIndex = string.index(string.startIndex,offsetBy: start+1)
                let endIndex = string.index(string.startIndex,offsetBy: index)
                let subString = string[startIndex..<endIndex]// 或者  string.dropFirst(4).prefix(9-4)
                let array = subString.components(separatedBy: ",")
                tree.value = array;
                string = String(string.dropLast(string.count - index + (index-start)) + string.dropFirst(index+1)) // 删除
                break;
            }
        }
        return tree;
    }
}

