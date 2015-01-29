//
//  ViewController.m
//  单例模式
//
//  Created by lh on 15/1/29.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "ViewController.h"
#import "LHObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LHObject *obj = [LHObject sharedLHObject];
    NSLog(@"%@", obj);
}


@end
