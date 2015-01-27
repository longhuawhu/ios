//
//  ViewController.m
//  核心动画－图标抖动效果实现
//
//  Created by lh on 15/1/27.
//  Copyright (c) 2015年 lh. All rights reserved.
//


#define Angele2Radian(angle) (((angle)/180.0)*M_PI)
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
- (IBAction)start;
- (IBAction)stop;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"transform.rotation";
    
    CGFloat angle = Angele2Radian(10);
    anim.values = @[@(-angle), @(angle),@(angle)];
    anim.duration = 0.2;
    anim.repeatCount = 10;
    
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    [self.iconView.layer addAnimation:anim forKey:nil];
}

- (IBAction)start {
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"transform.rotation";
    
    CGFloat angle = Angele2Radian(10);
    anim.values = @[@(-angle), @(angle),@(-angle)];
    anim.duration = 0.2;
    anim.repeatCount = CGFLOAT_MAX;
    
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    [self.iconView.layer addAnimation:anim forKey:@"shake"];

}

- (IBAction)stop {
    [self.iconView.layer removeAnimationForKey:@"shake"];
}
@end
