//
//  ViewController.m
//  nodes
//
//  Created by 王本东 on 22/02/2020.
//

#import "ViewController.h"
#import "Node.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 链表反转
    Node *newNode = [Node constructList];
    [Node printList:newNode];
    Node *reverseNode  = [Node reverseList:newNode];
    [Node printList:reverseNode];
}




@end
