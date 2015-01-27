//
//  ViewController.m
//  手势识别
//
//  Created by lh on 15/1/27.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UIView *iconImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}
-(BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

-(void)testPinchAndRotaion
{
    [self testPinch];
    [self testRotation];
}
-(void)testPinch
{
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView)];
    pinch.delegate = self;
    [self.iconImage addGestureRecognizer:pinch];
}

-(void)pinchView:(UIPinchGestureRecognizer *) pinch
{
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    pinch.scale = 1;
}
-(void)testRotation
{
    UIRotationGestureRecognizer *recognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationfun:)];
    recognizer.delegate = self;
    [self.view addGestureRecognizer:recognizer];
}

-(void)rotationfun:(UIRotationGestureRecognizer *)recognizer
{
    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
    recognizer.rotation = 0;
}

-(void) testTap
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    
    
    NSLog(@"%d", self.iconImage.userInteractionEnabled);
    self.iconImage.userInteractionEnabled = NO;
    
    [self.iconImage addGestureRecognizer:tap];
    
    [tap addTarget:self action:@selector(tapView)];
 
}
-(void)tapView
{
    NSLog(@"tapView");
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
