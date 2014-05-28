//
//  OrderViewController.m
//  daogoubao
//
//  Created by xiangchenyu on 14-5-27.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "OrderViewController.h"
#import "OrderTableViewCell.h"
#import "CatalogTableview.h"
#import "OrderModel.h"

@interface OrderViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, assign) BOOL hasPay;

@property (nonatomic, strong) NSMutableArray *paidOrders;
@property (nonatomic, strong) NSMutableArray *unpaidOrders;

@end

@implementation OrderViewController

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
    self.title = @"订单详情";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initData];
    [self initSegment];
    [self initTableView];
    
    [self initPaidOrders];
    [self initUnPaidOrders];
    // Do any additional setup after loading the view.
}

#pragma mark--init
-(void) initData
{
    self.paidOrders = [NSMutableArray array];
    self.unpaidOrders = [NSMutableArray array];
}
-(void) initUnPaidOrders
{
    for(int i = 0 ;i < 20 ;++ i)
    {
        NSString* num = [NSString stringWithFormat:@"%d",i];
        NSString *imageUrl = [NSString stringWithFormat:@"demo_%d.jpg",(i + 1)%4];
        NSDictionary *dic = @{@"orderTime": @"2010-12-3",
                              @"buyer":num,
                              @"imageHeader":imageUrl,
                              @"title":@"未付款",
                              @"content":num,
                              @"price":num,
                              @"count":num};
        OrderModel *order = [[OrderModel alloc]initWithDic:dic];
        [self.unpaidOrders addObject:order];
    }
}

-(void) initPaidOrders
{
    for(int i = 0 ;i < 20 ;++ i)
    {
        NSString *num = [NSString stringWithFormat:@"%d",i];
        NSString *imageUrl = [NSString stringWithFormat:@"demo_%d.jpg",i%4];
        NSDictionary *dic = @{@"orderTime": @"2012-12-3",
                              @"buyer":num,
                              @"imageHeader":imageUrl,
                              @"title":@"已经付款",
                              @"content":num,
                              @"price":num,
                              @"count":num};
        OrderModel *order = [[OrderModel alloc]initWithDic:dic];
        [self.paidOrders addObject:order];
    }
    
}
-(void) initTableView
{
    int segmentheight = self.orderSegment.frame.size.height;
    int tableviewHeight = mScreenHeight - segmentheight - 64;
    self.orderTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, segmentheight, mScreenWidth, tableviewHeight) style:UITableViewStylePlain];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    self.orderTableView.delegate = self;
	self.orderTableView.dataSource = self;
    
    [self.view addSubview:self.orderTableView];
}

- (void)initSegment
{
    self.orderSegment = [[UISegmentedControl alloc] initWithItems:@[@"已支付",@"未支付"]];
    [self.orderSegment addTarget:self action:@selector(selectedTabChanged:) forControlEvents:UIControlEventValueChanged];
     [self.orderSegment setSelectedSegmentIndex:0];
    CGRect frame = self.view.frame;
    self.orderSegment.frame = CGRectMake(0, 0, frame.size.width, 45);
    
    [self.orderSegment setDividerImage:[UIImage imageNamed:@"divider"] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self.orderSegment setDividerImage:[UIImage imageNamed:@"divider"] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    [self.orderSegment setDividerImage:[UIImage imageNamed:@"divider"] forLeftSegmentState:UIControlStateSelected rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    
    [self.orderSegment setBackgroundImage:[UIImage imageNamed:@"segment_selected"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    [self.orderSegment setBackgroundImage:[UIImage imageNamed:@"segment_unselected"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    [self.orderSegment setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];
    [self.orderSegment setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    
    [self.view addSubview:self.orderSegment];
}

#pragma mark--common methods
-(NSArray*)currentActiveOrderArray
{
    return self.orderSegment.selectedSegmentIndex==0?self.paidOrders:self.unpaidOrders;
}
-(void) selectedTabChanged : (id) sender
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.orderTableView reloadData];
    });
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark--tableViewDelegate
#pragma mark -- tableview delegate
//表格区域
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}
//数目
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	long count=  [self currentActiveOrderArray].count;
    return count;
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"OrderTableViewCell" owner:self options:nil] lastObject];
    return cell.frame.size.height;
}

//每一行的数据
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIndentifier = @"cell";
    
	OrderTableViewCell *cell = (OrderTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIndentifier];
	
	if(cell == nil)
	{
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"OrderTableViewCell" owner:self options:nil] ;
        cell = [nib objectAtIndex:0];
	}
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    long row = [indexPath row];
    
    NSArray *array = [self currentActiveOrderArray];
    
    OrderModel *orderModel = [array objectAtIndex:row];
    
    cell.labelOrderTime.text = orderModel.orderTime;
    cell.labelBuyer.text   = orderModel.buyer;
    cell.imageViewHeader.image = [UIImage imageNamed:orderModel.imageHeader];
    cell.labelTitle.text   = orderModel.title;
    cell.labelContent.text = orderModel.content;
    cell.labelPrice.text   = orderModel.price;
    cell.labelCount.text   = orderModel.count;
    
    
	return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = [NSString stringWithFormat:@"%ld", [indexPath row]];
    mAlertView(@"当前点击的row-->", str);
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
