//
//  UIColor+UIImage.m
//  daogoubao
//
//  Created by xiangchenyu on 14-5-26.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "UIColor+UIImage.h"

@implementation UIColor (UIImage)

+ (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}
@end
