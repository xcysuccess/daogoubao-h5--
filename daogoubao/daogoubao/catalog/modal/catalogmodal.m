//
//  catalogmodal.m
//  daogoubao
//
//  Created by xiangchenyu on 14-5-19.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "catalogmodal.h"

@implementation catalogmodal

-(void)initWithDic:(NSDictionary *)dic
{
    self.imageUrl = dic[@"imageUrl"];
    self.title = dic[@"title"];
    self.commodityID = dic[@"commodityID"];
    self.price = dic[@"price"];
}



@end
