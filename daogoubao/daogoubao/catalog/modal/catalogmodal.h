//
//  catalogmodal.h
//  daogoubao
//
//  Created by xiangchenyu on 14-5-19.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface catalogmodal : NSObject

@property(nonatomic,strong) NSString *imageUrl;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *commodityID;
@property(nonatomic,strong) NSString *price;

-(void)initWithDic:(NSDictionary *)dic;

@end


