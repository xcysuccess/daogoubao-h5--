//
//  GoodsTableViewHeader.h
//  daogoubao
//
//  Created by xiangchenyu on 14-5-21.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsTableViewHeader : UITableViewHeaderFooterView

@property (weak, nonatomic) IBOutlet UIButton *buttonBookmark;
@property (weak, nonatomic) IBOutlet UILabel  *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel  *labelPrice;
@property (weak, nonatomic) IBOutlet UILabel  *labelStock;

@end
