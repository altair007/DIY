//
//  CFFirstViewController.h
//  DIY
//
//  Created by   颜风 on 14-6-4.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CFFirstViewControllerDelegate <NSObject>
@required
- (NSString *) latestLableContent;

@end

@interface CFFirstViewController : UIViewController
@property (assign ,nonatomic) id<CFFirstViewControllerDelegate> delegate; //!< 代理
@property (retain, nonatomic) UILabel * label; //!< 标签
@end
