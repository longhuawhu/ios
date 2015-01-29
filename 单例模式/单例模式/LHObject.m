//
//  LHObject.m
//  单例模式
//
//  Created by lh on 15/1/29.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "LHObject.h"

@implementation LHObject

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static LHObject *instance;
    
    //dispatch_once线程安全的
    static dispatch_once_t onceToken;
    //dispatch_once宏保证块代码中指令只执行一次
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    
    return instance;
}

+(instancetype)sharedLHObject
{
    return [[self alloc] init];
}

@end
