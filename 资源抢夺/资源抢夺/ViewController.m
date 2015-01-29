//
//  ViewController.m
//  资源抢夺
//
//  Created by lh on 15/1/29.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (atomic, assign) NSInteger tickets;
@property (nonatomic, strong) NSMutableDictionary *dict;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tickets = 500;
    [self doGcd];
}


-(void) doSaleLoop:(NSString *) opName
{
    while (YES) {
   //     @synchronized(self){
        if(self.tickets > 0)
        {
                --self.tickets;
                    if(self.dict[@(self.tickets)])
                    {
                        NSLog(@"********** %d", self.tickets);
                    }
                    else
                    {
                        [self.dict setObject:@(self.tickets) forKey:@(self.tickets)];
                    }
        }
        else
        {
            break;
        }

 //       }
    }
}

-(void)doGcd
{
    dispatch_queue_t q = dispatch_queue_create("ticket", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(q, ^{
        [self doSaleLoop:@"sale1"];
    });
    
    dispatch_async(q, ^{
        [self doSaleLoop:@"sale2"];
    });
}
@end
