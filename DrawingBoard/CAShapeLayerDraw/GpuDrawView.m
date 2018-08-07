//
//  GpuDrawView.m
//  DrawingBoard
//
//  Created by hu on 2018/8/7.
//  Copyright © 2018年 wu. All rights reserved.
//

#import "GpuDrawView.h"

@interface GpuDrawView()

@property (nonatomic, strong) NSMutableArray *paths;
// 预留做撤销使用
@property (nonatomic, strong) NSMutableArray *layers;

@end

@implementation GpuDrawView
#pragma mark - init
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
#pragma mark - touch
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    [path moveToPoint:point];
    [self.paths addObject:path];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    UIBezierPath *path = [self.paths lastObject];
    [path addLineToPoint:point];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.lineWidth = 5;
    layer.strokeStart = 0;
    layer.strokeEnd = 1;
    layer.lineCap = kCALineCapRound;
    layer.lineJoin = kCALineJoinRound;
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    [self.layers addObject:layer];
    layer.path = path.CGPath;
    [self.layer addSublayer:layer];
}

#pragma mark - getter
- (NSMutableArray *)paths
{
    if (!_paths) {
        _paths  = [NSMutableArray array];
    }
    return _paths;
}
- (NSMutableArray *)layers
{
    if (!_layers) {
        _layers = [NSMutableArray array];
    }
    return _layers;
}
@end
