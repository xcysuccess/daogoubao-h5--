//
//  GoodsViewController.h
//  daogoubao
//
//  Created by xiangchenyu on 14-5-21.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBStepperField.h"
#import "TBGroupButtons.h"
#import "GoodsModalVC.h"

@class GoodTableview;

@interface GoodsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,TBStepperFieldDelegate,TBGroupButtonsDelegate>

{
    NSMutableSet *set;
}
@property(nonatomic, strong) TBStepperField *tbTextField;
@property(nonatomic, strong) UITableView *tableViewGoods;
@property(nonatomic, strong) GoodsModalVC *goodsmodel;
@end
