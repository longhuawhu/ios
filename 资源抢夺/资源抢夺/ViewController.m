//
//  ViewController.m
//  资源抢夺
//
//  Created by lh on 15/1/29.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) NSInteger tickets;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tickets = 10;
    [self doSaleLoop];
}


-(void) doSaleLoop
{
    while (YES) {
        if(self.tickets > 0)
            --self.tickets;
        else
            break;
    }
   
    
    NSLog(@"%d ", self.tickets);
}
@end
