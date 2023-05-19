//
//  Node.m
//  nodes
//
//  Created by 王本东 on 22/02/2020.
//

#import "Node.h"

@implementation Node

// 链表反转  当取给  初始新  2空12  临当新当
+ (Node *)reverseList:(Node *)root
{
    // 定义遍历指针，初始化为头结点
        Node *current = root;
        // 反转后的链表头部
        Node *newH = nil;
    
        // 遍历链表
        while (current != nil) {  // 注意始终保持  节点负值
            // 记录下一个结点
            Node *temp = current.next;  // ⚠️临时取2
            // 当前结点的next指向新链表头部
            current.next = newH;    // ⚠️当前取 null 节点
            // 更改新链表头部为当前结点
//            newH.value = p.value;
//            newH.next = p.next;
            newH = current;      //  ⚠️新取1
            // 移动p指针
            current = temp;     //   当前⚠️取2
        }
    
        // 返回反转后的链表头结点
        return newH;
}

- (Node *)reverseList:(Node *)root
{
    return [Node reverseList:root];
}

// 构造一个链表
+ (Node *)constructList
{
    // 头结点定义
    Node *head = nil;
       // 记录当前结点
    Node *cur = nil;
    
       for (int i = 1; i < 5; i++) {
           Node *node = [Node new];
           node.value = i;
           // 头结点为空，新结点即为头结点
           if (head == NULL) {
               head = node;
           }
           else{   // 当前结点的next为新结点
               cur.next = node;
           }
           // 设置当前结点为新结点
           cur = node;
       }
       return head;
}

// 打印链表中的数据
+ (void)printList:(Node *)head
{
     Node* temp = head;
        while (temp != NULL) {
            printf("node is %d \n", temp.value);
            temp = temp.next;
        }
}


@end
