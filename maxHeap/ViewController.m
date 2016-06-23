//
//  ViewController.m
//  maxHeap
//
//  Created by yuanhongyang on 16/6/22.
//  Copyright © 2016年 yuanhongyang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSArray *array = @[@2,@34,@121,@1,@13,@5,@656,@23,@90];
    
    //最大堆排序
    [self getMaxHeapSort:array];
    
    //最小堆排序
    [self getMinHeapSort:array];
}

#pragma mark - 最小堆排序
- (void)getMinHeapSort:(NSArray *)array{
    
    NSMutableArray *mutable = [NSMutableArray arrayWithArray:array];
    //初始化最小堆排序
    mutable = [self creatMinHeap:mutable];
    
    NSInteger num = mutable.count;
    
    while (num > 1) {
        [mutable exchangeObjectAtIndex:0 withObjectAtIndex:num - 1];
        
        [self minHeapAdjust:mutable index:0 length:num - 1];
        num--;
    }
    NSMutableString *str = [NSMutableString string];
    for (NSNumber *number in mutable) {
        [str appendString:[NSString stringWithFormat:@"%@,",number]];
    }
    NSLog(@"最小堆排序:%@",str);
}

- (NSMutableArray *)creatMinHeap:(NSMutableArray *)mutable{
    for (NSInteger i = (mutable.count / 2 - 1); i >= 0; i--) {
        //自下而上调整堆的最小值
        mutable = [self minHeapAdjust:mutable index:i length:mutable.count];
    }
    return mutable;
}

- (NSMutableArray *)minHeapAdjust:(NSMutableArray *)mutable index:(NSInteger)index length:(NSInteger)length{
    
    //当前节点的左子节点的索引
    NSInteger leftChildIndex = index * 2 + 1;
    //当前节点右子节点的索引
    NSInteger rightChildIndex = index * 2 + 2;
    
    //假设当前节点所对应的值是最小值
    NSInteger minValueIndex = index;
    
    if (leftChildIndex < length && mutable[leftChildIndex] < mutable[minValueIndex]) {
        minValueIndex = leftChildIndex;
    }
    
    
    if (rightChildIndex < leftChildIndex && mutable[rightChildIndex] < mutable[minValueIndex]) {
        minValueIndex = rightChildIndex;
    }
    
    if (minValueIndex != index) {
        [mutable exchangeObjectAtIndex:minValueIndex withObjectAtIndex:index];
        //向下调整堆排序
        mutable = [self minHeapAdjust:mutable index:minValueIndex length:length];
    }
    
    return mutable;
}

#pragma mark - 最大堆排序
- (void)getMaxHeapSort:(NSArray *)array{

    NSMutableArray *mutable = [NSMutableArray arrayWithArray:array];
    
    //第一次排序，最大值放置到mutable[0]
    mutable = [self createMaxHeap:mutable];
    
    NSInteger num = mutable.count;
    
    while (num > 1) {
        [mutable exchangeObjectAtIndex:0 withObjectAtIndex:num - 1];
        [self maxHeapAdjust:mutable index:0 length:num - 1];
        
        num --;
    }
    
    NSMutableString *str = [NSMutableString string];
    for (NSNumber *number in mutable) {
        [str appendString:[NSString stringWithFormat:@"%@,",number]];
    }
    NSLog(@"最大堆排序:%@",str);
}

- (NSMutableArray *)createMaxHeap:(NSMutableArray *)mutable{
    
    for (NSInteger i = (mutable.count / 2 - 1); i >= 0; --i) {
        mutable = [self maxHeapAdjust:mutable index:i length:mutable.count];
    }
    
    return mutable;
}

- (NSMutableArray *)maxHeapAdjust:(NSMutableArray *)mutable index:(NSInteger)index length:(NSInteger)length{
    
    //获取当前节点的左子节点索引
    NSInteger leftChildIndex = index * 2 + 1;
    
    //获取当前节点的右子节点索引
    NSInteger rightChiledIndex = index * 2 + 2;
    
    //假设当前节点是最大值的索引
    NSInteger maxValueIndex = index;
    
    if (leftChildIndex < length && mutable[leftChildIndex] > mutable[maxValueIndex]) {
        maxValueIndex = leftChildIndex;
    }
    
    if (rightChiledIndex < length && mutable[rightChiledIndex] > mutable[maxValueIndex]) {
        maxValueIndex = rightChiledIndex;
    }
    
    if (maxValueIndex != index) {
        
        [mutable exchangeObjectAtIndex:maxValueIndex withObjectAtIndex:index];
        //向下调整堆结构
        mutable = [self maxHeapAdjust:mutable index:maxValueIndex length:length];
    }
    
    return mutable;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
