//
//  UIControlMacro.h
//  daogoubao
//
//  Created by xiangchenyu on 14-5-19.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#ifndef daogoubao_UIControlMacro_h
#define daogoubao_UIControlMacro_h

//简单的以AlertView显示提示信息
#define mAlertView(title, msg) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil \
cancelButtonTitle:@"确定" \
otherButtonTitles:nil]; \
[alert show];

#endif
