//
//  UIColor+HexConvert.m
//  HaiDian
//
//  Created by Haike_Mac on 15/4/18.
//  Copyright (c) 2015年 Haike_Mac. All rights reserved.
//

#import "UIColor+HexConvert.h"

@implementation UIColor (HexConvert)

+ (UIColor *)colorFromHexString:(NSString *)hexString
{
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end
