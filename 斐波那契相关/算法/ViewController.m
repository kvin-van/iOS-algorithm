//
//  ViewController.m
//  算法
//
//  Created by 王本东 on 13/05/2020.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //最长斐波那契数列
    NSLog(@"%ld",(unsigned long)[self fibonacciOfLengh:@[@1,@3,@7,@11,@12,@14,@18,@25,@39]]);
    NSLog(@"%ld",(unsigned long)[self fibonacciOfLengh:@[@1,@2,@3,@4,@5,@6,@7,@8]]);
    
    //第N个斐波那契数列的值
    NSLog(@"第N位斐波那契数列 数值为：%ld",(unsigned long)[self fibonacciN:6]);
    //数组里的斐波那契数列下标  仅2位
    NSLog(@"1下标%@",[self fibonacciArray:@[@7,@3,@4] and:11]);
    NSLog(@"2下标%@",[self fibonacciArray:@[@3,@3,@4] and:6]);
}

#pragma mark - 最长斐波那契数列
/*输入: [1,2,3,4,5,6,7,8]
输出: 5
原因: 最长斐波那契数列: [1,2,3,5,8]
输入: [1,3,7,11,12,14,18]
输出: 3
原因: [1,11,12],[3,11,14],[7,11,18]*/

- (NSInteger )fibonacciOfLengh:(NSArray*)array
{
    NSInteger length = 0;
    NSInteger flag = 2;
    for (int i = 0; i < (int)array.count-1; ++i) {
        NSNumber *num = array[i];
        for (int j = i+1; j <  (int)array.count-1; j++) {
            NSNumber *x = array[j];
            NSNumber *y = @([num integerValue] + [x integerValue]);
            if([array containsObject:y]){
                NSLog(@"包含：%@+%@=%@",num,x,y);
                num = x;
                j = (int)[array indexOfObject:y];
                j--;//抵消 稍后的 j++
                flag++;
            }
            else{//不包含继续循环
            }
        }
        if(flag > length && flag > 2){
            length = flag;
        }
        flag =2;
    }
    return length;
}

#pragma mark - 第N个斐波那契数列的值
- (NSInteger)fibonacciN:(NSInteger)n
{
    if (n <= 1){
        return n;
    }
    NSInteger first = 0;
    NSInteger second = 1;
    for (int i=0; i< n-1; i++) { //相加了 n-1 次
        NSInteger sum = first + second;
        first = second;
        second = sum;
    }
    return  second;
}

#pragma mark - 数组里的斐波那契数列下标  仅2位
/*  快手面试题
 输入: [7,3,4]   11
输出: [0,2]
输入: [3,3]  6
输出: [0,1]
*/
- (NSArray *)fibonacciArray:(NSArray *)array and:(int)target
{
    NSMutableDictionary *saveDic = @{}.mutableCopy;
    for (int i=0; i<array.count; i++) {
        NSNumber *x = array[i];
        NSNumber *y = [NSNumber numberWithInt:target - x.intValue];
        if(saveDic[y.stringValue] != nil){
            return @[saveDic[y.stringValue],[NSNumber numberWithInt:i]];
        }
        else{
            [saveDic setObject:[NSNumber numberWithInt:i] forKey:x.stringValue];
        }
    }
    return @[];
}

@end

