//
//  CFMyViewController.m
//  DIY
//
//  Created by   颜风 on 14-5-29.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "CFMyViewController.h"

@interface CFMyViewController ()

@end

@implementation CFMyViewController

- (void)dealloc
{
    self.imageView = nil;
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // UIImgView控件
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"01.jpg"]];
    imageView.frame = CGRectMake(self.view.frame.size.width * 0.05, self.view.frame.size.height * 0.1, self.view.frame.size.height*0.5, self.view.frame.size.width * 0.5);
    
    // 打开交互
    imageView.userInteractionEnabled = YES;
    
    self.imageView = imageView;
    [self.view addSubview:self.imageView];
    [imageView release];
    
    // 六个按钮
    NSArray * titles = @[@"轻拍", @"长按" , @"平移", @"旋转", @"捏合", @"轻扫"];
    __block CGRect base = CGRectMake(self.view.frame.size.width * 0.07, self.view.frame.size.height * 0.6, self.view.frame.size.width / 7, self.view.frame.size.height * 0.1);
    [titles enumerateObjectsUsingBlock:^(NSString * title, NSUInteger idx, BOOL *stop) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = base;
        [self.view addSubview: button];
        [button setTitle:title forState:UIControlStateNormal];
        [button addTarget:self action:@selector(didClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        base = CGRectMake(base.origin.x + base.size.width, base.origin.y, base.size.width, base.size.height);
        
    }];
    
}

- (void) didClickButtonAction: (UIButton *) button
{
    // 重置视图:先重置transform,再重置frame!
	self.imageView.transform = CGAffineTransformIdentity;
    self.imageView.frame = CGRectMake(self.view.frame.size.width * 0.05, self.view.frame.size.height * 0.1, self.view.frame.size.height*0.5, self.view.frame.size.width * 0.5);
    self.imageView.image = [UIImage imageNamed:@"01.jpg"];
    
    // 清除所有已有手势
    self.imageView.gestureRecognizers = nil;
    
    // 获取button的title信息
    NSString * title = [button titleForState: UIControlStateNormal];
    
    // 根据title信息,绑定不同的手势
    if ([title isEqualToString:@"轻拍"]) {
        UITapGestureRecognizer * tapGeture = [[UITapGestureRecognizer alloc] initWithTarget:self action: @selector(tapGesture:)];
        tapGeture.numberOfTouchesRequired = 2;
        [self.imageView addGestureRecognizer:tapGeture];
        [tapGeture release];
    }
    
    if ([title isEqualToString:@"长按"]) {
        UILongPressGestureRecognizer * longPressGeture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action: @selector(longPressGesture:)];
        [self.imageView addGestureRecognizer:longPressGeture];
        [longPressGeture release];
    }
    
    if ([title isEqualToString:@"平移"]) {
        UIPanGestureRecognizer * panGeture = [[UIPanGestureRecognizer alloc] initWithTarget:self action: @selector(panGesture:)];
        [self.imageView addGestureRecognizer:panGeture];
        [panGeture release];
    }
    
    if ([title isEqualToString:@"旋转"]) {
        UIRotationGestureRecognizer * rotationGeture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action: @selector(rotationGesture:)];
        [self.imageView addGestureRecognizer:rotationGeture];
        [rotationGeture release];
    }
    
    
    if ([title isEqualToString:@"捏合"]) {
        UIPinchGestureRecognizer * pinchGeture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action: @selector(pinchGesture:)];
        [self.imageView addGestureRecognizer:pinchGeture];
        [pinchGeture release];
    }
    
    
    if ([title isEqualToString:@"轻扫"]) {
        UISwipeGestureRecognizer * swipeGetureLandscape = [[UISwipeGestureRecognizer alloc] initWithTarget:self action: @selector(swipeGesture:)];
        swipeGetureLandscape.direction = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;
        [self.imageView addGestureRecognizer:swipeGetureLandscape];
        [swipeGetureLandscape release];
        
        UISwipeGestureRecognizer * swipeGetureVertical = [[UISwipeGestureRecognizer alloc] initWithTarget:self action: @selector(swipeGesture:)];
        swipeGetureVertical.direction = UISwipeGestureRecognizerDirectionDown | UISwipeGestureRecognizerDirectionUp;
        [self.imageView addGestureRecognizer:swipeGetureVertical];
        [swipeGetureVertical release];
    }
    
}

- (void) tapGesture: (UITapGestureRecognizer *) gesture
{
    // 要求:轻拍手势：双指、单击，修改imageView的frame为(0,0,320,200)
    gesture.view.frame = CGRectMake(0, 0, 320, 200);
}

- (void) longPressGesture: (UILongPressGestureRecognizer *) gesture
{
    // 长按手指：单指，imageview的图像修改为另一张图像
    if (1 == gesture.numberOfTouchesRequired) {
        self.imageView.image = [UIImage imageNamed:@"02.png"];
    }
}

- (void) panGesture: (UIPanGestureRecognizer *) gesture
{
    CGPoint translation = [gesture translationInView:gesture.view.superview];
    
    gesture.view.center = CGPointMake(gesture.view.center.x+translation.x, gesture.view.center.y+translation.y);
    
    [gesture setTranslation:CGPointZero inView:gesture.view.superview];
}

- (void) rotationGesture: (UIRotationGestureRecognizer *) gesture
{
    gesture.view.transform = CGAffineTransformRotate(gesture.view.transform, gesture.rotation);
    
    gesture.rotation = 0;
}

- (void) pinchGesture: (UIPinchGestureRecognizer *) gesture
{
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, gesture.scale, gesture.scale);
    
	gesture.scale = 1;
}

- (void) swipeGesture: (UISwipeGestureRecognizer *) gesture
{
    if (gesture.direction == (UISwipeGestureRecognizerDirectionUp |UISwipeGestureRecognizerDirectionDown)) {// 竖向
        //图像随机切换
        NSArray * imgs = @[@"01.jpg", @"02.png"];
        self.imageView.image = [UIImage imageNamed:imgs[arc4random()%2]];
        return;
    }
    
    // 横向:横向轻扫实现：图像消失，随机修改imageview的背景颜色
    self.imageView.image = nil;
    self.imageView.backgroundColor = [[[UIColor alloc]initWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:arc4random()%256/255.0] autorelease];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
