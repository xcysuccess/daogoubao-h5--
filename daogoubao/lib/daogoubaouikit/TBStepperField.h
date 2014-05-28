//
//  TBStepperField.h
//  daogoubao
//
//  Created by xiangchenyu on 14-5-22.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TextFieldKeyType)
{
    TextFieldKeyboardNumber = 0,
    TextFieldKeyboardNone
};

@protocol TBStepperFieldDelegate;

@interface TBStepperField : UIView<UITextFieldDelegate>
{
    UIButton *buttonMinus;
    UIButton *buttonAdd;
    UITextField *textField;
    TextFieldKeyType textFieldType;
}
@property (nonatomic, weak)id<TBStepperFieldDelegate>          delegate;

- (id)initWithFrame:(CGRect)frame withDelegate:(id<TBStepperFieldDelegate>)__delegate keyBoard:(TextFieldKeyType) tfType;
- (void) setTextField :(NSString*) str;
   
- (void) textFieldResignFirstResponder;
@end

@protocol TBStepperFieldDelegate <NSObject>

- (void) buttonAddClick : (TBStepperField*) field numberCurrent : (NSString *) str;
- (void) buttonMinusClick : (TBStepperField*) field numberCurrent : (NSString *) str;

@end
