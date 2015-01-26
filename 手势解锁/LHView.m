//
//  LHView.m
//  手势解锁
//
//  Created by lh on 15/1/26.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "LHView.h"

@interface LHView()
@property (nonatomic, strong)NSMutableArray *selectedButtons;
@property (nonatomic, assign)CGPoint currentPoint;
@end

@implementation LHView

-(NSMutableArray *)selectedButtons
{
    if (_selectedButtons == nil) {
        _selectedButtons = [NSMutableArray array];
    }
    return _selectedButtons;
}

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self  setup];
    }
    
    return self;
}

-(void)setup
{
   // self.backgroundColor = [UIColor redColor];
    
    for (int i = 0; i < 9; ++i) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.userInteractionEnabled = NO;
        [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_highligthed"] forState:UIControlStateSelected];
        btn.tag = i;
        
        [self addSubview:btn];
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    for (int i = 0; i < 9; ++i) {
        UIButton *btn =  self.subviews[i];
        CGFloat btnW = 75;
        CGFloat btnH = 75;

        CGFloat marginX = (self.frame.size.width - 3*btnW)/4;
        CGFloat marginY = marginX;
        int row = i / 3;
        int col = i % 3;
        
        CGFloat btnX = marginX + col*(btnW +marginX);
        CGFloat btnY = marginY + row*(btnH + marginY);
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
    
}

-(void) drawRect:(CGRect)rect
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [[UIColor greenColor] set];
    
    for(int i = 0; i < self.selectedButtons.count; ++i)
    {
        UIButton *btn = self.selectedButtons[i];
        if(i == 0)
        {
            [path moveToPoint:btn.center];
        }
        else
        {
            
            [path addLineToPoint:btn.center];
        }
    }
    
    if(CGPointEqualToPoint(self.currentPoint, CGPointMake(-1, -1)))
    {
        ;
    }
    else{
      [path addLineToPoint:self.currentPoint];
    }
    
    [path setLineJoinStyle:kCGLineJoinBevel];
    [path setLineWidth:5];
    [path stroke];
}

-(CGPoint )pointWithTouches:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    return [touch locationInView:touch.view];
}

-(UIButton *)buttonWithPoint:(CGPoint) pos
{
    for( UIButton *btn in self.subviews) {
        if (CGRectContainsPoint(btn.frame, pos)) {
            return btn;
        }
    }
    
    return nil;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pos = [self pointWithTouches:touches];
    self.currentPoint = CGPointMake(-1, -1);
    
    UIButton *btn = [self buttonWithPoint:pos];
    
    if(btn != nil && btn.selected == NO)
    {
        btn.selected = YES;
        [self.selectedButtons addObject:btn];
    }
    
    [self setNeedsDisplay];
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pos = [self pointWithTouches:touches];
    
    UIButton *btn = [self buttonWithPoint:pos];
    
    if(btn != nil && btn.selected == NO)
    {
        btn.selected = YES;
        [self.selectedButtons addObject:btn];
    }
    else
    {
        self.currentPoint = pos;
    }
    
    [self setNeedsDisplay];
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
//    for (UIButton *btn in self.selectedButtons) {
//        btn.selected = NO;
//        [self.selectedButtons removeObject:btn];
//    }
    NSMutableString *str = nil;
    for (UIButton *btn in self.selectedButtons) {
        [str appendFormat:@"%d", btn.tag];
    }
    NSLog(@"%@", str);
    [self.selectedButtons makeObjectsPerformSelector:@selector(setSelected:) withObject:@(NO)];
    [self.selectedButtons removeAllObjects];
    [self setNeedsDisplay];
}
-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

@end
