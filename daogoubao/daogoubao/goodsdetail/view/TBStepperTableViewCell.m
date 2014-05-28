//
//  TBStepperTableViewCell.m
//  daogoubao
//
//  Created by xiangchenyu on 14-5-23.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "TBStepperTableViewCell.h"
#import "AppMacro.h"

@interface TBStepperTableViewCell()

-(void) initLabelHeader : (NSString*) title;

@end


@implementation TBStepperTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withFrame : (CGRect) rect withDelegate:(id<TBStepperFieldDelegate>)__delegate cellHeader : (NSString*) str  keyBoard:(TextFieldKeyType) tfType
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initLabelHeader : str];
        tbStepperfield = [[TBStepperField alloc] initWithFrame:CGRectMake(0, rect.size.height*0.5, mScreenWidth, rect.size.height*0.5) withDelegate:__delegate keyBoard:tfType];
        
        [self addSubview:tbStepperfield];

    }
    return self;
}

-(void) initLabelHeader :(NSString*) title
{
    labelHeader = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, mScreenWidth, self.frame.size.height *0.5)];
    labelHeader.backgroundColor = [UIColor clearColor];
    labelHeader.font = [UIFont systemFontOfSize:12.0f];
    labelHeader.textAlignment = NSTextAlignmentLeft;
    labelHeader.textColor = [UIColor lightGrayColor];
    labelHeader.text = title;
    [self addSubview:labelHeader];
}

- (TBStepperField*) getStepperField
{
    return tbStepperfield;
}
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id<TBStepperFieldDelegate>)  getTBStepperDelegate
{
    return tbStepperfield.delegate;
}

@end
