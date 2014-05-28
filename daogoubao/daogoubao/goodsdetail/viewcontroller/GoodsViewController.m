//
//  GoodsViewController.m
//  daogoubao
//
//  Created by xiangchenyu on 14-5-21.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "GoodsViewController.h"
#import "GoodsTableViewHeader.h"
#import "GoodTableview.h"
#import "TBLblBtnsTableViewCell.h"
#import "TBStepperField.h"
#import "TBStepperTableViewCell.h"
#import "AppMacro.h"


@interface GoodsViewController ()

@end

@implementation GoodsViewController

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
    [self initView];
}

-(void) initView
{
    self.title = @"商品详情";
     self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.tableViewGoods = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480) style:UITableViewStylePlain];
    self.tableViewGoods.delegate = self;
	self.tableViewGoods.dataSource = self;
    
    [self.view addSubview:self.tableViewGoods];
    [self.tableViewGoods registerNib:[UINib nibWithNibName:@"GoodsTableViewHeader" bundle:nil] forHeaderFooterViewReuseIdentifier:@"Header"];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.tableViewGoods.backgroundView addGestureRecognizer:tap];
    
    self.goodsmodel = [[GoodsModalVC alloc] init];
    
    set = [[NSMutableSet alloc] init];
    
}
-(void) tap:(id) sender
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- tableview delegate
//表格区域
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.goodsmodel.tableViewSection;
}
//数目
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.goodsmodel.tableCellCount;
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return self.goodsmodel.tableViewHeight;
}

//每一行的数据
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIndentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    
	if(cell == nil)
	{
        NSLog(@"[indexPath row]->%ld",[indexPath row]);
        switch ([indexPath row]) {
            case 0:
            {
                NSArray *array = @[@"实体票"];
                cell = [[TBLblBtnsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndentifier withFrame:CGRectMake(0, 0, mScreenWidth, 60) withDelegate:self cellHeader:@"提货方式"  arrayButtons:array];
            }
            break;
            case 1:
            {
                cell = [[TBStepperTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndentifier withFrame:CGRectMake(0, 0, mScreenWidth, 60) withDelegate:self cellHeader:@"购买数量" keyBoard:TextFieldKeyboardNumber];

                self.tbTextField = [((TBStepperTableViewCell*)cell) getStepperField];
            }
                break;
            case 2:
            {
                NSArray *array = @[@"黄色",@"白色"];
                cell = [[TBLblBtnsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndentifier withFrame:CGRectMake(0, 0, mScreenWidth, 60) withDelegate:self cellHeader:@"颜色"  arrayButtons:array];
            }
                break;
            default:
            {
                NSArray *array = @[@"送货上门",@"自己去取"];
                cell = [[TBLblBtnsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndentifier withFrame:CGRectMake(0, 0, mScreenWidth, 60) withDelegate:self cellHeader:@"提货方式"  arrayButtons:array];
            }
                break;
        }
	}

    __block long rowindex = [indexPath row];
    if([cell isKindOfClass:[TBLblBtnsTableViewCell class]])
        [(TBLblBtnsTableViewCell*)cell setButtonState:rowindex arrays:set];

    return cell;
}
//-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
//{
//    GoodsTableViewHeader *header = (GoodsTableViewHeader*)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"Header"];
//    return header.frame.size.height;
//}
//-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//    GoodsTableViewHeader *header = (GoodsTableViewHeader*)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"Header"];
//    [header setFrame:CGRectMake(0, 0, 320, 0)];
//    
//    self.tableViewGoods.tableHeaderView = header;
//
//    return header;
//}

#pragma mark--TBGroupButtonsDelegate
-(void) buttonSelect : (UIButton*) button TBGroupButtons : (NSMutableArray*) buttons
{
    NSInteger row = [[self.tableViewGoods indexPathForCell:(UITableViewCell *)(button.superview.superview.superview)] row];

    __block long tableRow = row;
    NSArray *arrayButton = buttons;
    UIButton *buttonClick = button;
    [arrayButton enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton *button = (UIButton*) obj;
        if([buttonClick isEqual:button] && button.selected == FALSE){
            [set addObject:[NSNumber numberWithLong:tableRow]];
            [buttonClick setSelected:YES];
            [buttonClick setBackgroundColor:[UIColor yellowColor]];
        }
        else if(button.selected == YES){
            [set removeObject:[NSNumber numberWithLong:tableRow]];
            [buttonClick setSelected:NO];
            [button setBackgroundColor:[UIColor grayColor]];
        }
    }];
    [set enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        NSLog(@"SET number-->%d",[obj intValue]);
    }];
}

#pragma mark--TBStepperFieldDelegate
- (void) buttonAddClick : (TBStepperField*) field numberCurrent : (NSString *) str
{
    NSScanner* scan = [NSScanner scannerWithString:str];
    int val;
    BOOL isInt = [scan scanInt:&val] && [scan isAtEnd];
    if(isInt == FALSE){
        mAlertView(@"错误", @"不能是字符串");
    }
    else{
        [field setTextField :[NSString stringWithFormat:@"%d", ++val]];
    }

}
- (void) buttonMinusClick : (TBStepperField*) field numberCurrent : (NSString *) str
{
    NSScanner* scan = [NSScanner scannerWithString:str];
    int val;
    BOOL isInt = [scan scanInt:&val] && [scan isAtEnd];
    if(isInt == FALSE){
        mAlertView(@"提示", @"不能是字符串");
    }
    else if(val <= 0){
        mAlertView(@"提示", @"不能小于0");
    }
    else{
        [field setTextField :[NSString stringWithFormat:@"%d", --val]];
    }

}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.tbTextField textFieldResignFirstResponder];
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
