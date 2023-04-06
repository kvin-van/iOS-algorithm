//
//  Node.h
//  nodes
//
//  Created by 王本东 on 22/02/2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject

@property (nonatomic,assign) int value; //值

@property (nonatomic,strong) Node *next; // 下标

// 链表反转
+ (Node *)reverseList:(Node *)root;
- (Node *)reverseList:(Node *)root;

// 构造一个链表
+ (Node *)constructList;

// 打印链表中的数据
+ (void)printList:(Node *)head;

@end

NS_ASSUME_NONNULL_END
