//
//  TBGroupButtons.h
//  daogoubao
//
//  Created by xiangchenyu on 14-5-23.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TBGroupButtonsDelegate;

@interface TBGroupButtons : UIView
{
    NSMutableArray *arrayButton;
    NSMutableArray *arrayButtonNames;
    int buttonInterval;
}

@property(nonatomic ,weak) id<TBGroupButtonsDelegate> delegate;
//buttonNames,按钮的名称的数据
- (id)initWithFrame:(CGRect)frame withDelegate:(id<TBGroupButtonsDelegate>)__delegate buttonNames :(NSArray*) array;

//button之间的间隔
-(void) resetButtonsInterval : (int) btnInterval;
-(NSMutableArray*) getArrayButton;

@end


@protocol TBGroupButtonsDelegate <NSObject>
-(void) buttonSelect : (UIButton*) button TBGroupButtons : (NSMutableArray*) buttons;
@end