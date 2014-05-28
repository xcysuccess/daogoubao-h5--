//
//  ViewController.m
//  daogoubao
//
//  Created by xiangchenyu on 14-5-19.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "ViewController.h"
#import "catalogviewcontroller.h"
#import "TBStepperField.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    TBStepperField* tbView = [[TBStepperField alloc] initWithFrame:CGRectMake(0, 200, mScreenWidth, 100) keyBoard:TextFieldKeyboardNumber];
//    [self.view addSubview:tbView];
//    [self dealTBStepperFieldBlock : tbView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)login:(id)sender
{
    catalogviewcontroller *clvcontroller = [[catalogviewcontroller alloc]init];
    [self.navigationController pushViewController:clvcontroller animated:YES];
}

@end
