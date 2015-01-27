//
//  ViewController.m
//  核心动画
//
//  Created by lh on 15/1/27.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) CALayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *layer = [CALayer layer];
    layer.position = CGPointMake(100, 100);
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    self.layer = layer;
   
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //1 创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    //2 设置动画对象
    // keyPath决定执行怎么的动画，调整哪个属性来执行动画
    anim.keyPath = @"position";
    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 200)];
   // anim.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 200)];
    anim.duration = 3;
    
    //设置动画完成不回退到原始位置,两个需要同时设置
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    //添加动画
    [self.layer addAnimation:anim forKey:nil];
}

@end
