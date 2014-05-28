//
//  TBGroupButtons.m
//  daogoubao
//
//  Created by xiangchenyu on 14-5-23.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "TBGroupButtons.h"
@interface TBGroupButtons()

-(void) initButtons;
-(UIButton*) createButton : (int) buttonNum offsetX :(float*) offsetX;
-(void) buttonSelect : (UIButton*) button;

@end

@implementation TBGroupButtons

- (id)initWithFrame:(CGRect)frame withDelegate:(id<TBGroupButtonsDelegate>)__delegate buttonNames :(NSArray*) array
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = __delegate;
        // Initialization code
        buttonInterval = 5;
        arrayButtonNames = [NSMutableArray arrayWithArray:array];
        [self initButtons];
        
    }
    return self;
}
-(void) resetButtonsInterval : (int) btnInterval
{
    buttonInterval = btnInterval;
    [self initButtons];
}

-(void) initButtons
{
    arrayButton = [NSMutableArray array];
    float offsetX = 0.f;
    for(int i = 0; i < arrayButtonNames.count; ++i)
    {
        UIButton *button = [self createButton : i offsetX:&offsetX];
        [arrayButton addObject:button];
        [button addTarget:self action:@selector(buttonSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(UIButton*) createButton : (int) buttonNum offsetX :(float*) offsetX
{
    UIFont *font = [UIFont systemFontOfSize:16.f];

    NSString *str = [arrayButtonNames objectAtIndex:buttonNum];
    float buttonHeight = self.frame.size.height;
    
    CGSize labsize = [str sizeWithFont:font constrainedToSize:CGSizeMake(5555, buttonHeight) lineBreakMode:NSLineBreakByWordWrapping];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(*offsetX, self.frame.origin.y, labsize.width, buttonHeight)];
    *offsetX = *offsetX + labsize.width + buttonInterval;
    [button setBackgroundColor:[UIColor grayColor]];
    
//    [button setBackgroundImage:[UIColor createImageWithColor : [UIColor grayColor]] forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIColor createImageWithColor : [UIColor yellowColor]] forState:UIControlStateHighlighted];

    
    [button setTitle:str forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    
    button.layer.cornerRadius = 5; //设置圆角
    button.layer.masksToBounds = YES;
    
    return button;    
}
-(NSMutableArray*) getArrayButton
{
    return arrayButton;
}
-(void) buttonSelect : (UIButton*) button
{
    if(self.delegate && [self.delegate respondsToSelector:@selector(buttonSelect:TBGroupButtons:)]) {
        [self.delegate buttonSelect:button TBGroupButtons:arrayButton];
    }
}


@end
