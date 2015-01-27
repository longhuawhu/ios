//
//  LHLayer.m
//  CALayer
//
//  Created by lh on 15/1/27.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "LHLayer.h"

@implementation LHLayer

-(void)drawInContext:(CGContextRef)ctx
{
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 100));
    
    CGContextFillPath(ctx);
}

@end
