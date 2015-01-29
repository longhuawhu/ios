//
//  ViewController.m
//  GCD演练
//
//  Created by lh on 15/1/28.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%@", [NSThread currentThread]);
    
    
    //[self gcdDemo3];
    [self demoOp1];
}


#pragma mark - GCD method

-(void)gcdDemo1
{
    dispatch_queue_t  q = dispatch_queue_create("cn.lh", DISPATCH_QUEUE_SERIAL);
    
    
    for(int i = 0; i < 10; i++)
    {
        dispatch_sync(q, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
        
    }
    
    for(int i = 0; i < 10; i++)
    {
        dispatch_async(q, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
 
    }
}

-(void)gcdDemo2
{
     dispatch_queue_t  q = dispatch_queue_create("cn.lh", DISPATCH_QUEUE_CONCURRENT);
    
   
    for(int i = 0; i < 10; i++)
    {
        dispatch_sync(q, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
        
    }
    
    for(int i = 0; i < 10; i++)
    {
        dispatch_async(q, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
        
    }
}

-(void)gcdDemo3
{
    dispatch_queue_t q = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    for(int i = 0; i < 10; i++)
    {
        dispatch_sync(q, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
        
    }
    
    for(int i = 0; i < 10; i++)
    {
        dispatch_async(q, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
        
    }
    
}



-(void) demoOp1
{
    NSBlockOperation *block = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"%@", [NSThread currentThread]);
    }];
    NSOperationQueue *myqueue = [[NSOperationQueue alloc] init];
    [myqueue addOperation:block];
    
}
@end
