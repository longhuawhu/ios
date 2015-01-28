//
//  LHWheelView.h
//  转盘
//
//  Created by lh on 15/1/28.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHWheelView : UIView
+(instancetype)wheel;
-(void)startRotation;
-(void)stopRotation;
@end
