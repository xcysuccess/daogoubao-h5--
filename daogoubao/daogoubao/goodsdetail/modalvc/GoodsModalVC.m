//
//  GoodsModalVC.m
//  daogoubao
//
//  Created by xiangchenyu on 14-5-21.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "GoodsModalVC.h"

@implementation GoodsModalVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tableViewSection = 1;
        self.tableViewHeight = 66;
        self.tableCellCount = 4;
    }
    return self;
}

-(NSArray*) getGoodsDetail
{
    return self.array;
}

-(void) saveGoodDetails :(NSArray*) array
{
    self.array = array;
}

@end
