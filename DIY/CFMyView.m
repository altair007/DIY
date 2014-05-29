//
//  CFMyView.m
//  DIY
//
//  Created by   颜风 on 14-5-28.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "CFMyView.h"

@interface CFMyView ()
@property (retain, nonatomic, readwrite) NSSet * types;
@end

@implementation CFMyView

#pragma mark - 便利初始化
- (instancetype) initWithFrame: (CGRect)frame
                          type: (NSString *) type
{
    if (self = [super initWithFrame:frame]) {
        self.types = [[[NSSet alloc] initWithArray:@[@"颜色随机", @"位置随机", @"大小随机", @"单双击"]] autorelease];
        
        if ( ! [self.types containsObject:type]) {
            return nil;
        }
        
        self.type = type;
    }
    
    return self;
}

#pragma mark - 重写方法
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSDictionary * dict = @{@"颜色随机":@"randomColorWhenTouch", @"位置随机":@"randomOriginWhenTouch", @"大小随机": @"randomSizeWhenTouch", @"单双击": @"click:"};
    
    NSString * method = [dict objectForKey:self.type];

    if ([self respondsToSelector:NSSelectorFromString(method)]) {
        [self performSelector:NSSelectorFromString(method) withObject:touches];
    }
}

#pragma mark - 实例方法
- (void) randomColorWhenTouch
{
    self.backgroundColor = [[[UIColor alloc] initWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0] autorelease];
}

- (void) randomOriginWhenTouch
{
    // 获取父视图的框架信息
    CGRect rectOfSuperView = self.superview.frame;
    
    self.center = CGPointMake(arc4random()%((NSInteger)rectOfSuperView.size.width+1), arc4random()%((NSInteger)rectOfSuperView.size.height+1));
}

- (void) randomSizeWhenTouch
{
    // 获取父视图的框架信息
    CGRect rectOfSuperView = self.superview.frame;
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, arc4random()%((NSInteger)rectOfSuperView.size.width+1), arc4random()%((NSInteger)rectOfSuperView.size.height+1));
}

- (void) click: (NSSet *) touches
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    UITouch * touch = [touches anyObject];
    
    if (touch.tapCount == 1) {
        [self performSelector:@selector(handleSingleTap) withObject:nil afterDelay:0.3];
    }else if(touch.tapCount == 2)
    {
        [self handleDoulbeTap];
    }  }

- (void) handleSingleTap
{
    [self randomColorWhenTouch];
}

-(void)handleDoulbeTap
{
    [self randomOriginWhenTouch];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
