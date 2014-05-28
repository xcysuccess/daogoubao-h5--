//
//  GoodsModalVC.h
//  daogoubao
//
//  Created by xiangchenyu on 14-5-21.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsModalVC : NSObject

@property(nonatomic, strong) NSArray *array;


@property(nonatomic, assign) int tableViewSection;
@property(nonatomic, assign) int tableViewHeight;
@property(nonatomic, assign) int tableCellCount;

-(NSArray*) getGoodsDetail;
-(void) saveGoodDetails :(NSArray*) array;

@end
