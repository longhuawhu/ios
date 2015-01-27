//
//  ViewController.m
//  CALayer
//
//  Created by lh on 15/1/27.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "ViewController.h"
#import "LHLayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LHLayer *layer = [LHLayer layer];
    layer.bounds = CGRectMake(0, 0, 300, 300);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    layer.position = CGPointMake(50, 50);
    layer.anchorPoint = CGPointZero;
    [layer setNeedsDisplay];
    [self.view.layer addSublayer:layer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
