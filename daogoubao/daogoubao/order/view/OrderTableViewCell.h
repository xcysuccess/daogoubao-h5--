//
//  OrderTableViewCell.h
//  daogoubao
//
//  Created by xiangchenyu on 14-5-27.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderTableViewCell : UITableViewCell

@property(nonatomic,weak) IBOutlet UILabel      *labelOrderTime;
@property(nonatomic,weak) IBOutlet UILabel      *labelBuyer;

@property(nonatomic,weak) IBOutlet UIImageView  *imageViewHeader;
@property(nonatomic,weak) IBOutlet UILabel      *labelTitle;
@property(nonatomic,weak) IBOutlet UILabel      *labelContent;
@property(nonatomic,weak) IBOutlet UILabel      *labelPrice;
@property(nonatomic,weak) IBOutlet UILabel      *labelCount;

@end
