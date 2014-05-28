//
//  OrderControl.m
//  daogoubao
//
//  Created by xiangchenyu on 14-5-27.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "OrderControl.h"

@implementation OrderControl

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tableViewSection = 1;
        self.tableViewHeight = 60;
        self.tableCellCount = 10;
    }
    return self;
}

@end
