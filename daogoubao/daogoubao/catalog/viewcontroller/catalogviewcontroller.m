//
//  catalogviewcontroller.m
//  daogoubao
//
//  Created by xiangchenyu on 14-5-19.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "catalogviewcontroller.h"
#import "TFHpple.h"
#import "catalogmodalvc.h"
#import "catalogTableView.h"
#import "AppMacro.h"
#import "ParserEngine.h"
#import "CatalogTableViewCell.h"
#import "GoodsViewController.h"
#import "TBLblBtnsTableViewCell.h"
#import "UIButton+Bootstrap.h"
#import "OrderViewController.h"

@interface catalogviewcontroller ()

-(void) loadModal;
-(void) initView;

@end

@implementation catalogviewcontroller

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
    [self loadModal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) initView
{
    self.title = @"商品列表";
    self.catTableView = [[CatalogTableview alloc] initWithFrame:CGRectMake(0, 0, 320, 480) style:UITableViewStylePlain];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.catTableView.delegate = self;
	self.catTableView.dataSource = self;
    
    [self.view addSubview:self.catTableView];
    
    UIButton *buttonOrder = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
    buttonOrder.backgroundColor = [UIColor redColor];
    [buttonOrder setTitle:@"订单页面" forState:UIControlStateNormal];
    [buttonOrder infoStyle];
    [buttonOrder addTarget:self action:@selector(buttonOrderClick:) forControlEvents:UIControlEventTouchUpInside];
   
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithCustomView:buttonOrder];
    self.navigationItem.rightBarButtonItem = rightButtonItem;

}

-(void) buttonOrderClick : (UIButton*) button
{
    OrderViewController *orderViewController = [[OrderViewController alloc] init];
    [self.navigationController pushViewController:orderViewController animated:YES];
    
}
-(void) loadModal
{
    self.catalogmodalvc = [[catalogmodalvc alloc]init];
    NSArray *array = [[ParserEngine sharedInstance] parseDemo];
    [self.catalogmodalvc saveComodites:array];
}

#pragma mark -- tableview delegate
//表格区域
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return self.catalogmodalvc.tableViewSection;
}
//数目
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.catalogmodalvc.getCommodites.count;
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return self.catalogmodalvc.tableViewHeight;
}

//每一行的数据
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIndentifier = @"cell";

	CatalogTableViewCell *cell = (CatalogTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIndentifier];
	
	if(cell == nil)
	{
		cell = [[CatalogTableViewCell alloc] initWithFrame:CGRectMake(0, 0, mScreenWidth, 40)];
	}
	catalogmodal *catalogModal = [self.catalogmodalvc.getCommodites objectAtIndex:[indexPath row]];
	cell.labelTitle.text = catalogModal.title;
    cell.labelID.text    = catalogModal.commodityID;
    cell.labelPrice.text = catalogModal.price;
    //异步并列执行
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *image = nil;
        NSURL *myUrl = [NSURL URLWithString:catalogModal.imageUrl];

        NSError *error;
        NSData *responseData = [NSData dataWithContentsOfURL:myUrl options:NSDataReadingMappedIfSafe error:&error];
        image = [UIImage imageWithData:responseData];
        //跳回主队列执行
        dispatch_async(dispatch_get_main_queue(), ^{
            //在主队列中进行ui操作
            [cell.imageHeader setImage:[UIImage imageWithData:responseData]];
        });
        
    });
    
	return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsViewController *goodsViewController = [[GoodsViewController alloc]init];
//    goodsViewController.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    [self.navigationController pushViewController:goodsViewController animated:YES];
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
