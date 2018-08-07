//
//  CpuDrawView.m
//  DrawingBoard
//
//  Created by hu on 2018/8/7.
//  Copyright © 2018年 wu. All rights reserved.
//

#import "CpuDrawView.h"

@interface CpuDrawView()

@property (nonatomic, strong) NSMutableArray *paths;

@end

@implementation CpuDrawView
#pragma mark - init
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
#pragma mark - drawRect
- (void)drawRect:(CGRect)rect
{
    for (UIBezierPath *path in self.paths) {
        // 连接处样式
        [path setLineJoinStyle:kCGLineJoinRound];
        // 头尾样式
        [path setLineCapStyle:kCGLineCapRound];
        [path stroke];
    }
}


#pragma mark - touch
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:touch.view];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 5;
    [path moveToPoint:point];
    [self.paths addObject:path];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:touch.view];
    [[self.paths lastObject] addLineToPoint:point];
    [self setNeedsDisplay];
}


#pragma getter
- (NSMutableArray *)paths
{
    if (!_paths) {
        _paths  = [NSMutableArray array];
    }
    return _paths;
}
@end
