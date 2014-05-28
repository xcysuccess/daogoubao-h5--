//
//  TBStepperTableViewCell.h
//  daogoubao
//
//  Created by xiangchenyu on 14-5-23.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBStepperField.h"

@interface TBStepperTableViewCell : UITableViewCell
{
    UILabel *labelHeader;
    TBStepperField *tbStepperfield;
}

-(id<TBStepperFieldDelegate>)  getTBStepperDelegate;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withFrame : (CGRect) rect withDelegate:(id<TBStepperFieldDelegate>)__delegate cellHeader : (NSString*) str  keyBoard:(TextFieldKeyType) tfType;

- (TBStepperField*) getStepperField;
@end
