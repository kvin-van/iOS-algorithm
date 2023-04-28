//
//  ViewController.m
//  算法
//
//  Created by 王本东 on 13/05/2020.
//

#import "ViewController.h"

#pragma mark - 链表
@implementation ListNode

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //链表相加
    ListNode *one = [ListNode new];  ListNode *three= [ListNode new];  ListNode *five= [ListNode new];
    ListNode *two= [ListNode new];  ListNode *four= [ListNode new];  ListNode *six= [ListNode new];
    one.val =2;one.next = three;
    three.val =4;three.next = five;
    five.val =3;five.next = NULL;

    two.val =5;two.next = four;
    four.val =6;four.next = six;
    six.val =6;six.next = NULL;

    ListNode *newlist = [self addListNode:one and:two];
    while (newlist && newlist.val >=0) {
        NSLog(@"%d",newlist.val);
        newlist = newlist.next;
    }
}

#pragma mark - 链表相加
/*
输入: (2 -> 4 -> 3) + (5 -> 6 -> 4)
输出: 7 -> 0 -> 8
原因: 342 + 465 = 807.
 思路： 两个指针同时顺序后移  考虑最后一次等于10 新增节点
 */
-(ListNode *)addListNode:(ListNode *)one and:(ListNode*)two
{
    ListNode *new = [ListNode new];
    ListNode *current;
    
    ListNode *p =one;  //1 号指针
    ListNode *q =two; //2 号指针
    int num =0 ; //进一位

    while (p !=NULL || q !=NULL) {
        ListNode *temp =  [ListNode new];
        int x = (p != NULL) ? p.val : 0;
        int y = (q != NULL) ? q.val : 0;
        int z = x + y +num;
        temp.val = z%10; //当前值
        num = z/10;  //进一位值
        
        if(new.next == NULL){  //首次负值
            new.val  =  temp.val ;
            current = temp;
            new.next = current;
        }
        else{
            current.val  = temp.val;
            current.next = temp;
            current = current.next;
        }
        
        if (p != NULL)
            p = p.next;
        if (q != NULL)
            q = q.next;
    }
    
    if(num>0){
        current.val = num;
    }
    else{
        current.val = -1;
    }
    
    return new;
}

#pragma mark - 单链表有环
/*
输入:1->2->3->4->5->null
 输入:1->2->3->4->5->3  如图 huan-2
输出: Yes or No
 */
-(BOOL)checkListNode:(ListNode *)one
{
    NSSet *set =[[NSSet alloc]init];
    while (one != NULL) {
        if([set containsObject:one]){
            return YES;
        }
        else{
            [set setByAddingObject:one];
        }
        one = one.next;
    }
    return NO;
}

@end

