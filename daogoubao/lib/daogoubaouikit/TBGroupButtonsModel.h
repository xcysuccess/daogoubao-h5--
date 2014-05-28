//
//  TBGroupButtonsModel.h
//  daogoubao
//
//  Created by xiangchenyu on 14-5-27.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RefreshTBGroupButtonsBlock)();

@interface TBGroupButtonsModel : NSObject

@property(nonatomic, strong) NSArray                     *buttonNames;       //buttons的名称
@property(nonatomic, assign) int                         btnInterval;        //button之间的间隔
@property(nonatomic, strong) RefreshTBGroupButtonsBlock  refreshTBGroupBtnsBlock; //重置TBGroupButtons

-(void) resetButtonsInterval : (int) btnInterval;

-(NSMutableArray*) getArrayButton;


@end
