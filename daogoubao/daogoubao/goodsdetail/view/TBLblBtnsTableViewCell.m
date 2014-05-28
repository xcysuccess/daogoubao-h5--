//
//  TBDetailTableViewCell.m
//  daogoubao
//
//  Created by xiangchenyu on 14-5-23.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "TBLblBtnsTableViewCell.h"
#import "AppMacro.h"

@interface TBLblBtnsTableViewCell()

@property(nonatomic) CGRect rect;

-(void) initLabelHeader : (NSString*) title;
-(void) initTBGroupButtons : (NSArray *)array withDelegate :(id<TBGroupButtonsDelegate>) __delegate;

@end

@implementation TBLblBtnsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withFrame : (CGRect) frame withDelegate:(id<TBGroupButtonsDelegate>)__delegate cellHeader : (NSString*) str arrayButtons : (NSArray*) array
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.rect = frame;
        self.backgroundColor = [UIColor clearColor];
        [self initLabelHeader : str];
        [self initTBGroupButtons : array withDelegate:__delegate];
    }
    return self;
}
-(void) initLabelHeader :(NSString*) title
{
    labelHeader = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, mScreenWidth, self.rect.size.height *0.5)];
    labelHeader.backgroundColor = [UIColor clearColor];
    labelHeader.font = [UIFont systemFontOfSize:16.0f];
    labelHeader.textAlignment = NSTextAlignmentLeft;
    labelHeader.textColor = [UIColor lightGrayColor];
    labelHeader.text = title;
    [self.contentView addSubview:labelHeader];
}
-(void) initTBGroupButtons : (NSArray *)array withDelegate :(id<TBGroupButtonsDelegate>) __delegate
{
    tbGroupButtons = [[TBGroupButtons alloc] initWithFrame:CGRectMake(0, labelHeader.frame.size.height, mScreenWidth, self.rect.size.height * 0.5) withDelegate:__delegate buttonNames:array];
     
    [[tbGroupButtons getArrayButton] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton *button = (UIButton*) obj;
        [self.contentView addSubview:button];
    }];
}

-(void) setButtonState : (long) tableRowIndex arrays: (NSSet*) set
{
//    UIButton *button = [[tbGroupButtons getArrayButton] objectAtIndex:buttonIndex];
    [[tbGroupButtons getArrayButton] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton *button = (UIButton*)obj;
        if([set containsObject:[NSNumber numberWithLong:tableRowIndex]])
            [button setBackgroundColor:[UIColor yellowColor]];
        else
            [button setBackgroundColor:[UIColor grayColor]];
    }];
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

@end
