//
//  CFSecondViewController.m
//  DIY
//
//  Created by   颜风 on 14-6-4.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "CFSecondViewController.h"

@interface CFSecondViewController ()

@end

@implementation CFSecondViewController

-(void)dealloc
{
    self.tf = nil;
    
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
    self.view.backgroundColor = [UIColor greenColor];
    
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"上一个" style:UIBarButtonItemStylePlain target:self action:@selector(didClickLeftBarButonItemAction:)] autorelease];
    
    self.tf = [[[UITextField alloc] initWithFrame:CGRectMake(100, 100, 100, 50)] autorelease];
    self.tf.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview: self.tf];
}

- (NSString *) latestLableContent
{
    return self.tf.text;
}

- (void) didClickLeftBarButonItemAction:(id) sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
