//
//  AppMacro.h
//  daogoubao
//
//  Created by xiangchenyu on 14-5-19.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#ifndef daogoubao_AppMacro_h
#define daogoubao_AppMacro_h

/*---------------------------------程序相关常数-------------------------------------*/
//App Id、下载地址、评价地址
#define kAppId      @"593499239"
#define kAppUrl     [NSString stringWithFormat:@"https://itunes.apple.com/us/app/ling-hao-xian/id%@?ls=1&mt=8",kAppId]
#define kRateUrl    [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",kAppId]

#define kPlaceholderImage       [UIImage imageNamed:@"placeholderImage.png"]

//----------页面设计相关-------

#define mNavBarHeight         44
#define mTabBarHeight         49
#define mLandScape 	([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeLeft || [UIApplication sharedApplication].statusBarOrientation ==  UIInterfaceOrientationLandscapeRight)
#define mPortrait ([UIApplication sharedApplication].statusBarOrientation == UIDeviceOrientationPortrait || [UIApplication sharedApplication].statusBarOrientation == UIDeviceOrientationPortraitUpsideDown)
#define mScreenWidth \
(mLandScape)?\
MAX([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)\
:\
MIN([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)


#define mScreenHeight \
(mPortrait? MAX([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height): MIN([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height))


#endif
