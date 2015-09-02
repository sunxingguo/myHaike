//
//  ColorManager.h
//  HaiDian
//
//  Created by Haike_Mac on 15/4/18.
//  Copyright (c) 2015年 Haike_Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ColorManager : NSObject

+ (instancetype)sharedManager;
- (UIColor *)backgroundColor;
- (UIColor *)navigationBarColor;
- (UIColor *)segmentControllerSelectedTextColor;
- (UIColor *)placeHolderColor;
- (UIColor *)suggestCellColor;
- (UIColor *)incomeNumberColor;
- (UIColor *)incomeBalanceNameColor;
- (UIColor *)incomeGrayBackgroundColor;
- (UIColor *)incomeGraySlideColor;
- (UIColor *)tradeRecordPinkTitleColor;
- (UIColor *)tradeRecordGrayTitleColor;
- (UIColor *)tradeRecordHorizenSlideColor;
- (UIColor *)yellowButtonColor;
- (UIColor *)grayTitleColor;
- (UIColor *)orangeTitleColor;
- (UIColor *)checkTicketNumberGrayColor;

@end
