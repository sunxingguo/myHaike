//
//  FactoryUI.m
//  HaiDian
//
//  Created by 嗨客－孙兴国 on 15/9/2.
//  Copyright (c) 2015年 haike_sunxingguo. All rights reserved.
//

#import "FactoryUI.h"

@implementation FactoryUI

//创建首页上的标题BBI
+ (UIBarButtonItem *)CreateProjectTitleBBI{

    //初始化标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 240, 30)];
    titleLabel.text = @"嗨课";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = FONT_YAHEI(12);
    
    UIBarButtonItem *titleBBI = [[UIBarButtonItem alloc] initWithCustomView:titleLabel];
    
    return titleBBI;
}

//创建用来调整BBI位置的一个占位的BBI
//@param Width 要调整的宽度，可以为负数，负数就是相反方向
+ (UIBarButtonItem *)CreateSpaceBBIWithWidth:(CGFloat)Width{

    UIBarButtonItem *spaceBBI = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceBBI.width = Width;
    
    return spaceBBI;
}

//创建应用返回的BBI
//@param target 事件的目标对象   @param action 事件的函数
+ (UIBarButtonItem *)CreateBackBBIWithTarget:(id)target
                                      action:(SEL)action{

    //创建一个View来接收返回的图片和分割线
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    
    //返回图片
    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    backImageView.image = [UIImage imageNamed:@"home_normal"];
    [bgView addSubview:backImageView];
    
    //返回手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [bgView addGestureRecognizer:tap];
    
    UIBarButtonItem *backBBI = [[UIBarButtonItem alloc] initWithCustomView:bgView];
    
    return backBBI;
}

//创建应用的分割线
+ (UIBarButtonItem *)CreateSplitLineBBI{

    UIBarButtonItem *splitLineBBI = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:nil action:nil];
    splitLineBBI.tintColor = [UIColor whiteColor];
    
    return splitLineBBI;
}

//创建只带标题的BBI
+ (UIBarButtonItem *)CreateTitleBBI:(NSString *)title
                             target:(id)target
                             action:(SEL)action{

    UIBarButtonItem *titleBBI = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    titleBBI.tintColor = [UIColor whiteColor];
    
    return titleBBI;
}

//创建嗨课通用的BBI
+ (UIBarButtonItem *)CreateHKBBIWithTitle:(NSString *)title
                                    image:(UIImage *)image
                                   target:(id)target
                                   action:(SEL)action{

    //设置一个容器来存放图片和标题
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 44)];
    
    //设置图片
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:contentView.bounds];
    imageView.image = image;
    //设置样式
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [contentView addSubview:imageView];
    
    //设置标题
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, contentView.bounds.size.width, 14)];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor whiteColor];
    label.text = title;
    label.font = FONT_YAHEI(10);
    
    [contentView addSubview:label];
    
    //设置点击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [contentView addGestureRecognizer:tap];
    
    UIBarButtonItem *BBI = [[UIBarButtonItem alloc] initWithCustomView:contentView];
    
    return BBI;
}

//创建通用的背景颜色
+ (UIColor *)CreateVCBackColor{
 
    return [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_hover"]];
}

//创建整个应用的主题色
+ (UIColor *)CreateThemeColorWithRed:(CGFloat)redValue
                               green:(CGFloat)greenValue
                                blue:(CGFloat)blueValue{

    return [UIColor colorWithRed:redValue / 255.0f green:greenValue / 255.0f blue:blueValue / 255.0 alpha:1];
}

@end
