//
//  TBDetailTableViewCell.h
//  daogoubao
//
//  Created by xiangchenyu on 14-5-23.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBGroupButtons.h"

@interface TBLblBtnsTableViewCell : UITableViewCell
{
    UILabel *labelHeader;
    TBGroupButtons *tbGroupButtons;
}
//button的名称数组
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withFrame : (CGRect) rect withDelegate:(id<TBGroupButtonsDelegate>)__delegate cellHeader : (NSString*) str arrayButtons : (NSArray*) array;


-(void) setButtonState : (long) tableRowIndex arrays: (NSSet*) set;
@end
