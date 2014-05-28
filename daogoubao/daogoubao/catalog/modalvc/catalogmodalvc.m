//
//  catalogmodalvc.m
//  daogoubao
//
//  Created by xiangchenyu on 14-5-20.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "catalogmodalvc.h"
#import "catalogmodal.h"

@implementation catalogmodalvc

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tableViewSection = 1;
        self.tableViewHeight = 66;
    }
    return self;
}
-(NSArray*) getCommodites
{
    return self.array;
}

-(void) saveComodites :(NSArray*) array
{
    self.array = array;
}


@end
