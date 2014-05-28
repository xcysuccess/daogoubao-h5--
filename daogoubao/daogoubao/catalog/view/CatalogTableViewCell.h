//
//  CatalogTableViewCell.h
//  daogoubao
//
//  Created by xiangchenyu on 14-5-20.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CatalogTableViewCell : UITableViewCell

@property(nonatomic, strong) UIImageView *imageHeader;
@property(nonatomic ,strong) UILabel *labelTitle;
@property(nonatomic ,strong) UILabel *labelID;
@property(nonatomic ,strong) UILabel *labelPrice;

@end
