//
//  CFMyView.h
//  DIY
//
//  Created by   颜风 on 14-5-28.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  简单的自定义视图
 */
@interface CFMyView : UIView
#pragma mark - 属性
@property (retain, nonatomic) NSString * type; //!< 视图类型
@property (retain, nonatomic, readonly) NSSet * types; //!< 可选视图类型.

#pragma mark - 便利初始化
/**
 *  便利初始化
 *
 *  @param frame 框架信息
 *  @param type  视图风格:目前支持@"颜色随机",@"位置随机",@"大小随机", @"单双击"
 *
 *  @return 初始化后的对象.
 */
- (instancetype) initWithFrame: (CGRect)frame
                          type: (NSString *) type;

#pragma mark - 实例方法

/**
 *  触摸时,随机变色
 */
- (void) randomColorWhenTouch;

/**
 *  触摸时,随机变换位置
 */
- (void) randomOriginWhenTouch;

/**
 *  触摸时,随机变换大小
 */
- (void) randomSizeWhenTouch;

/**
 *  响应点击事件
 *
 *  @param touch 触摸事件的详细信息
 */
- (void) click: (NSSet *) touch;

/**
 *  响应单击事件
 */
- (void) handleSingleTap;

/**
 *  响应双击事件
 */
-(void)handleDoulbeTap;
@end
