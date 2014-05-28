//
//  ParserEngine.h
//  DynamicNativeJson
//
//  Created by xiangchenyu on 14-5-17.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParserEngine : NSObject


+(ParserEngine*) sharedInstance;

-(void) parseIndex1;
-(void) parseIndex2;
-(NSArray*) parseDemo;

@end
