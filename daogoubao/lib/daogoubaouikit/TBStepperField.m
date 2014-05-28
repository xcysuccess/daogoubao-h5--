//
//  TBStepperField.m
//  daogoubao
//
//  Created by xiangchenyu on 14-5-22.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "TBStepperField.h"

@interface TBStepperField ()

-(void) initButtonMinus;
-(void) initButtonAdd;
-(void) initTextField;

-(BOOL) dealKeyTypeNumber : (NSString *)string;

-(NSString*) getTextFieldText;
-(void) buttonAddMethod;
-(void) buttonMinusMethod;

@end

@implementation TBStepperField

- (id)initWithFrame:(CGRect)frame withDelegate:(id<TBStepperFieldDelegate>)__delegate keyBoard:(TextFieldKeyType) tfType
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor whiteColor]];
        self.delegate = __delegate;
        [self initButtonMinus];
        [self initTextField];
        [self initButtonAdd];
        textFieldType = tfType;
    }
    return self;
}
#pragma mark--view init
-(void) initButtonMinus
{
    buttonMinus = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    
    [buttonMinus setBackgroundColor:[UIColor grayColor]];
    [buttonMinus setTitle:@"-" forState:UIControlStateNormal];
    buttonMinus.titleLabel.font = [UIFont systemFontOfSize:16.f];
    [buttonMinus setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    
    buttonMinus.layer.cornerRadius = 5; //设置圆角
    buttonMinus.layer.masksToBounds = YES;
    [self addSubview:buttonMinus];

    [buttonMinus addTarget:self action:@selector(buttonMinusMethod) forControlEvents:UIControlEventTouchUpInside];
}

-(void) initButtonAdd
{
    buttonAdd = [[UIButton alloc]initWithFrame:CGRectMake(150, 0, 30, 30)];
    
    [buttonAdd setBackgroundColor:[UIColor grayColor]];
    [buttonAdd setTitle:@"+" forState:UIControlStateNormal];
    buttonAdd.titleLabel.font = [UIFont systemFontOfSize:16.f];
    [buttonAdd setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    
    buttonAdd.layer.cornerRadius = 5; //设置圆角
    buttonAdd.layer.masksToBounds = YES;
    [self addSubview:buttonAdd];
    
    [buttonAdd addTarget:self action:@selector(buttonAddMethod) forControlEvents:UIControlEventTouchUpInside];
}
-(void) initTextField
{
    textField = [[UITextField alloc] initWithFrame:CGRectMake(30, 0, 120, 30)];
    textField.backgroundColor = [UIColor clearColor];
    textField.font = [UIFont systemFontOfSize:16.f];
    textField.layer.cornerRadius = 5; //设置圆角
    textField.layer.borderWidth = 0.5f;
//    self.textField.placeholder = @"1.f";
    textField.text = @"1";
    
    //文字自适应，这样的化，如果用户输入较多文字，那字体就会自动缩小，来尽量显示全部
    textField.adjustsFontSizeToFitWidth=YES;
    //清除按钮是否出现
    textField.clearButtonMode=UITextFieldViewModeNever;
    textField.delegate = self;
    [self addSubview:textField];
    
}


#pragma mark--textField delegatge
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    switch (textFieldType) {
        case TextFieldKeyboardNumber:
            return [self dealKeyTypeNumber:string];
            break;
        default:
            break;
    }
    return YES;
};

#pragma mark--function
-(BOOL) dealKeyTypeNumber : (NSString *)str
{
    static NSString* const NUMBERS = @"0123456789";
    NSCharacterSet *charset = nil;
    charset = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
    NSString *filtered = [[str componentsSeparatedByCharactersInSet:charset] componentsJoinedByString:@""];
    BOOL isSame = [str isEqualToString:filtered];
    return isSame;
}
-(NSString*) getTextFieldText
{
    NSString *str = textField.text;
    NSCharacterSet *whitespace = [NSCharacterSet  whitespaceAndNewlineCharacterSet];
    str = [str  stringByTrimmingCharactersInSet:whitespace];
    return str;
}
-(void) buttonAddMethod
{
    NSString* str = [self getTextFieldText];
    [self.delegate buttonAddClick:self numberCurrent:str];
}
-(void) buttonMinusMethod
{
    NSString* str = [self getTextFieldText];
    [self.delegate buttonMinusClick:self numberCurrent:str];
}
- (void) setTextField :(NSString*) str
{
    textField.text = str;
}

- (void) textFieldResignFirstResponder
{
    [textField resignFirstResponder];
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
