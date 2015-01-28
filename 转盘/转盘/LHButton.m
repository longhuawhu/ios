//
//  LHButton.m
//  转盘
//
//  Created by lh on 15/1/28.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "LHButton.h"

@implementation LHButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
     CGFloat imageH = 40;
     CGFloat imageW = 47;
     CGFloat imageX = (contentRect.size.width - imageW)*0.5;
     CGFloat imageY = 20;
    
    return  CGRectMake(imageX, imageY, imageW, imageH);
}
-(void)setHighlighted:(BOOL)highlighted
{
    
}

@end
