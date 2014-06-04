//
//  CFFirstViewController.m
//  DIY
//
//  Created by   颜风 on 14-6-4.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "CFFirstViewController.h"
#import "CFSecondViewController.h"

@interface CFFirstViewController ()

@end

@implementation CFFirstViewController
-(void)dealloc
{
    self.label = nil;
    
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
    self.view.backgroundColor = [UIColor redColor];
    UILabel * lable = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    lable.text = @"默认";
    lable.backgroundColor = [UIColor greenColor];
    self.label = lable;
    
    [self.view addSubview: lable];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一个" style:UIBarButtonItemStylePlain target:self action:@selector(didClickNextBarButtonItemAciton:)];
    
    [lable release];
}

- (void) didClickNextBarButtonItemAciton:(id) sender
{
    CFSecondViewController * secondVC = [[CFSecondViewController alloc] init];
    self.delegate = secondVC;
    [self.navigationController pushViewController:secondVC animated:YES];
    [secondVC release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.label.text = [self.delegate latestLableContent];
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
