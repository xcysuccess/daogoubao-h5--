//
//  OrderModel.m
//  daogoubao
//
//  Created by xiangchenyu on 14-5-27.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "OrderModel.h"

@implementation OrderModel

-(id)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.orderTime  = dic[@"orderTime"];
        self.buyer      = dic[@"buyer"];
        self.imageHeader  = dic[@"imageHeader"];
        self.title      = dic[@"title"];
        self.content    = dic[@"content"];
        self.price      = dic[@"price"];
        self.count      = dic[@"count"];
    }
    return self;
}
@end
