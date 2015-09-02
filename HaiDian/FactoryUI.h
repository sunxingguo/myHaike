//
//  FactoryUI.h
//  HaiDian
//
//  Created by 嗨客－孙兴国 on 15/9/2.
//  Copyright (c) 2015年 haike_sunxingguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FactoryUI : NSObject

//创建首页上的标题BBI（背景图片）
+ (UIBarButtonItem *)CreateProjectTitleBBI;

//创建用来调整BBI位置的一个占位的BBI
//@param Width 这个宽度是要调整的宽度，可以为负数，负数就是相反方向
+ (UIBarButtonItem *)CreateSpaceBBIWithWidth:(CGFloat)Width;

//创建应用返回的BBI
//@param target 事件的目标对象     @param action 事件的函数
+ (UIBarButtonItem *)CreateBackBBIWithTarget:(id)target
                                      action:(SEL)action;

//创建分割线
+ (UIBarButtonItem *)CreateSplitLineBBI;

//创建只带标题的BBI
+ (UIBarButtonItem *)CreateTitleBBI:(NSString *)title
                             target:(id)target
                             action:(SEL)action;

//创建嗨课通用的BBI
+ (UIBarButtonItem *)CreateHKBBIWithTitle:(NSString *)title
                                    image:(UIImage *)image
                                   target:(id)target
                                   action:(SEL)action;

//创建通用的背景颜色
+ (UIColor *)CreateVCBackColor;

//创建整个应用的主题色
+ (UIColor *)CreateThemeColorWithRed:(CGFloat)redValue
                               green:(CGFloat)greenValue
                                blue:(CGFloat)blueValue;

@end
