//
//  CFSecondViewController.h
//  DIY
//
//  Created by   颜风 on 14-6-4.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CFFirstViewController.h"

@interface CFSecondViewController : UIViewController <CFFirstViewControllerDelegate>
@property (retain, nonatomic) UITextField * tf; //!<文本编辑框
@end
