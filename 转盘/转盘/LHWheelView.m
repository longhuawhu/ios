//
//  LHWheelView.m
//  转盘
//
//  Created by lh on 15/1/28.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "LHWheelView.h"
#import "LHButton.h"

@interface LHWheelView ()
@property (weak, nonatomic) IBOutlet UIImageView *wheelView;
@property (nonatomic, strong) LHButton *selectedBtn;
@property (nonatomic, strong) CADisplayLink *link;
- (IBAction)startChoose:(id)sender;

@end

@implementation LHWheelView
+(instancetype)wheel
{
   return  [[[NSBundle mainBundle] loadNibNamed:@"LHWheel" owner:nil options:nil] lastObject];
}

-(void)awakeFromNib
{
    self.wheelView.userInteractionEnabled = YES;
    UIImage *bigImage = [UIImage imageNamed:@"LuckyAstrology"];
     UIImage *bigImageSelected = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    
    CGFloat smallW = bigImage.size.width/12 * [UIScreen mainScreen].scale;
    CGFloat smallH = bigImage.size.height;
    
    for (int index = 0; index < 12; ++index) {
        LHButton *btn = [LHButton buttonWithType:UIButtonTypeCustom];

        CGRect smallRect = CGRectMake(index * smallW, 0, smallW, smallH);
        CGImageRef smallImage = CGImageCreateWithImageInRect(bigImage.CGImage, smallRect);
        [btn setImage:[UIImage imageWithCGImage:smallImage] forState:UIControlStateNormal];
        
        CGImageRef smallImageSelected = CGImageCreateWithImageInRect(bigImageSelected.CGImage, smallRect);
        [btn setImage:[UIImage imageWithCGImage:smallImageSelected] forState:UIControlStateNormal];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        btn.bounds = CGRectMake(0, 0, 68, 143);
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        btn.layer.position = CGPointMake(self.wheelView.frame.size.width*0.5, self.wheelView.frame.size.height*0.5);
        CGFloat angle = 30/180.0 * M_PI;
        btn.transform = CGAffineTransformMakeRotation(angle * index);
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [self.wheelView addSubview:btn];
    }
}


-(void) btnClick:(LHButton *)btn
{
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
}
-(void)startRotation
{
//    CABasicAnimation *anim = [CABasicAnimation animation];
//    anim.keyPath = @"transform.rotation";
//    anim.toValue = @(2*M_PI);
//    anim.duration = 5;
//
//    anim.repeatCount = 10;
//    [self.wheelView.layer addAnimation:anim forKey:nil];
    
    //1 s 刷新60次
    if (self.link) {
        return;
    }
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    self.link = link;
}
-(void)stopRotation
{
    [self.link invalidate];
    self.link = nil;
}


-(void)update
{
     self.wheelView.transform = CGAffineTransformRotate(self.wheelView.transform, M_PI/360);
}

- (IBAction)startChoose:(id)sender {
    [self stopRotation];
    
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.toValue = @(2*M_PI*10);
    anim.duration = 2.0;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    anim.delegate = self;
    [self.wheelView.layer addAnimation:anim forKey:nil];
    self.userInteractionEnabled = NO;
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.userInteractionEnabled = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)( 2 *NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startRotation];
    });
}
@end
