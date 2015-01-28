//
//  ViewController.m
//  转盘
//
//  Created by lh on 15/1/28.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "ViewController.h"
#import "LHWheelView.h"

@interface ViewController ()
- (IBAction)start;
- (IBAction)stop;


@property (nonatomic, weak) LHWheelView *wheel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LHWheelView *wheel = [LHWheelView wheel];
    wheel.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5);
   // [wheel startRotation];
    [self.view addSubview:wheel];
    
    self.wheel = wheel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start {
    [self.wheel startRotation];
}

- (IBAction)stop {
    [self.wheel stopRotation];
}
@end
