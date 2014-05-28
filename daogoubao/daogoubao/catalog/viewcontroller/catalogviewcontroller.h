//
//  catalogviewcontroller.h
//  daogoubao
//
//  Created by xiangchenyu on 14-5-19.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CatalogTableview;
@class catalogmodalvc;

@interface catalogviewcontroller : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) CatalogTableview *catTableView;
@property(nonatomic, strong) catalogmodalvc *catalogmodalvc;


@end
