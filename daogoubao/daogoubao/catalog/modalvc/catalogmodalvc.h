//
//  catalogmodalvc.h
//  daogoubao
//
//  Created by xiangchenyu on 14-5-20.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class catalogmodal;

@interface catalogmodalvc : NSObject

@property(nonatomic, strong) NSArray *array; //Comodites


@property(nonatomic, assign) int tableViewSection;
@property(nonatomic, assign) int tableViewHeight;


-(NSArray*) getCommodites;
-(void) saveComodites :(NSArray*) array;

@end
