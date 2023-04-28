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
    
    NSMutableArray *array = @[@"10",@"2",@"5",@"6",@"8",@"1",@"2",@"9",@"7",@"11",@"0"].mutableCopy;
    [self fastSortArray:array withCriticalIndex:0 andRightIndex:array.count-1];
    NSLog(@"有序数组%@",array);
    
    //二分查找法
    NSArray *arr = @[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13];
    NSLog(@"数组位置：%ld",[self findValue:arr andValue:@2]);
    NSLog(@"数组位置：%ld",[self findValue:arr andValue:@7]);
    NSLog(@"数组位置：%ld",[self findValue:arr andValue:@11]);
    NSLog(@"数组位置：%ld",[self findValue:arr andValue:@13]);
    NSLog(@"数组位置：%ld",[self findValue:arr andValue:@14]);
}

#pragma mark   快速排序
- (void)fastSortArray:(NSMutableArray *)arr withCriticalIndex:(NSInteger)criticalIndex andRightIndex:(NSInteger)rightIndex
{
    if (criticalIndex > rightIndex) {//如果分界值的index>数组的长度
        return ;
    }
    NSInteger i = criticalIndex;
    NSInteger j = rightIndex;
    //记录分界值key
    NSInteger key = [arr[i] integerValue];
 // 条件：分界值的index小于数组长度
    while (i < j) {
        //先从最右边开始查比key小的值
        while (i < j && [arr[j] integerValue] >= key) {//如果比key大，继续查找
            j--;
        }
        //当循环到arr[j]比key小时，则将查找到的小值调换到i的位置
        arr[i] = arr[j];
        //当在右边找到比key小的值是，从i开始查往后查比key大的值
        while (i < j && [arr[i] integerValue] <= key) {//如果比key小，继续查找
            i++;
        }
        //当循环到arr[i]比key大时，则将查到的最大值调换到j的位置
        arr[j] = arr[i];
    }
    //i==j时退出循环，此时给arr[i]或arr[j]赋值为key
    arr[j] = @(key);
    //递归排序key左边的部分
    [self fastSortArray:arr withCriticalIndex:0 andRightIndex:i - 1];
    //递归排序key右边的部分
    [self fastSortArray:arr withCriticalIndex:i + 1 andRightIndex:rightIndex];
}

#pragma mark   二分查找法
//思路：定义 两个指针 动态取值范围。 然后比较中间值
- (NSInteger)findValue:(NSArray *)array andValue:(NSNumber *)val
{
    NSInteger right = array.count-1;
    NSInteger left = 0;
    
    while (left <=right) {
        NSInteger mid = (left + right)/2;
        NSNumber* key = array[mid];
        
        if([key intValue]> [val intValue]){
            right = mid-1;
        }
        else if([key intValue] < [val intValue]){
            left = mid +1;
        }
        else{
            return mid;
            break;
        }
    }
    
    if(left > right){
        NSLog(@"没有值");
    }
    return -1;
}

#pragma mark - 我的快排
- (void)findMedian:(NSMutableArray <NSNumber *>*)arr
{
    [self quickSort:arr index:0 and:arr.count-1];
    
    NSLog(@"快排数组%@",arr);
    NSLog(@"中位数%@",arr[arr.count/2]);
}

- (void)quickSort:(NSMutableArray *)array index:(NSInteger)start and:(NSInteger)end
{
    NSInteger low = start;
    NSInteger high = end;
    NSNumber *key = array[end];
    while (low < high)
    {
        //左边找比key大的值
        while (low < high && [array[low] integerValue] <= key.integerValue){//必须要小于等于  才能换
            ++low;
        }
        //右边找比key小的值
        while (low < high && [array[high] integerValue] >= key.integerValue){//必须要大于等于  才能换
            --high;
        }
        if (low < high) {
            NSNumber *temp = array[low];
            [array replaceObjectAtIndex:low withObject:array[high]];
            [array replaceObjectAtIndex:high withObject:temp];
        }
    }
    
    NSNumber *temp = array[high];
    [array replaceObjectAtIndex:high withObject:array[end]];
    [array replaceObjectAtIndex:end withObject:temp];
    
    if(start < low){
        [self quickSort:array index:start and:low-1];
    }
    if(end >high){
        [self quickSort:array index:high+1 and:end];
    }
}

@end

