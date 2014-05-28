//
//  OrderModel.h
//  daogoubao
//
//  Created by xiangchenyu on 14-5-27.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderModel : NSObject

@property(nonatomic,strong) NSString  *orderTime;
@property(nonatomic,strong) NSString  *buyer;

@property(nonatomic,strong) NSString  *imageHeader;
@property(nonatomic,strong) NSString  *title;
@property(nonatomic,strong) NSString  *content;
@property(nonatomic,strong) NSString  *price;
@property(nonatomic,strong) NSString  *count;

-(id) initWithDic : (NSDictionary*) dic;

@end
