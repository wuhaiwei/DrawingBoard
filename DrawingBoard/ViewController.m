//
//  ViewController.m
//  DrawingBoard
//
//  Created by hu on 2018/8/7.
//  Copyright © 2018年 wu. All rights reserved.
//

#import "ViewController.h"
#import "CpuDrawView.h"
#import "GpuDrawView.h"


#define kScreenWidth   [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController


/**
 drawRect方式画板   cpu绘制
 */
- (IBAction)cpu_Draw:(id)sender {
    CpuDrawView *cpuDrawView = [[CpuDrawView alloc] init];
    cpuDrawView.frame = CGRectMake(0, -kScreenHeight, kScreenWidth * 5, 2 * kScreenHeight - 100);
    [self.view addSubview:cpuDrawView];
}
/**
 CAShaperlayer方式画板  gpu绘制
 */
- (IBAction)gpu_Draw:(id)sender {
    GpuDrawView *gpuDrawView = [[GpuDrawView alloc] init];
    gpuDrawView.frame = CGRectMake(0, -kScreenHeight, kScreenWidth * 5, 2 * kScreenHeight - 100);
    [self.view addSubview:gpuDrawView];
}
/**
 重新选择画板类型
 */
- (IBAction)rechooseDrawingView:(id)sender {
    for (UIView *subView in self.view.subviews) {
        if ([subView isKindOfClass:[CpuDrawView class]] || [subView isKindOfClass:[GpuDrawView class]]) {
            [subView removeFromSuperview];
        }
    }
}

@end
