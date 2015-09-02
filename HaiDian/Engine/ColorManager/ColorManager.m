//
//  ColorManager.m
//  HaiDian
//
//  Created by Haike_Mac on 15/4/18.
//  Copyright (c) 2015年 Haike_Mac. All rights reserved.
//

#import "ColorManager.h"
#import "UIColor+HexConvert.h"

static NSString * kBackgroundColorHexString = @"#EAEAEA";
static NSString * kNavigationBarColrHexString = @"#FACF2A";
static NSString * kSegmentTabSelectionColorHexString = @"#F9A257";
static NSString * kPlaceholderColorHexString = @"#C8C8CD";
static NSString * kSuggestCellColorHexString = @"#EAEAEA";
static NSString * kIncomeNumberColorHexString = @"#F6560A";
static NSString * kIncomeBalanceNameColorString = @"#A3A3A3";
static NSString * kIncomeGrayBackgroundColorString = @"#EAEAEA";
static NSString * kIncomeGraySlideColorString = @"#C5C5C5";
static NSString * kTradeRecordPinkTitleColor = @"#F6570A";
static NSString * kTradeRecordGrayTitleColor = @"#878787";
static NSString * kTradeRecordHorizenSlideColor = @"#D0D0D0";
static NSString * kYellowButtonColor = @"#FACF2A";
static NSString * kGrayTitleColor = @"#A4A4A4";
static NSString * kOrangeTitleColor = @"#FA5000";
static NSString * KCheckTicketNumberGrayColor = @"#575757";

static ColorManager *instance = nil;

@implementation ColorManager

#pragma mark - interface method
+ (instancetype)sharedManager
{
    @synchronized(self){
        if (nil == instance) {
            instance = [[super alloc] init];
        }
    }
    return instance;
}

- (UIColor *)backgroundColor
{
    return [UIColor colorFromHexString:kBackgroundColorHexString];
}

- (UIColor *)navigationBarColor
{
    return [UIColor colorFromHexString:kNavigationBarColrHexString];
}

- (UIColor *)segmentControllerSelectedTextColor
{
    return [UIColor colorFromHexString:kSegmentTabSelectionColorHexString];
}

- (UIColor *)placeHolderColor
{
    return [UIColor colorFromHexString:kPlaceholderColorHexString];
}

- (UIColor *)suggestCellColor
{
    return [UIColor colorFromHexString:kSuggestCellColorHexString];
}

- (UIColor *)incomeNumberColor
{
    return [UIColor colorFromHexString:kIncomeNumberColorHexString];
}

- (UIColor *)incomeBalanceNameColor
{
    return [UIColor colorFromHexString:kIncomeBalanceNameColorString];
}

- (UIColor *)incomeGrayBackgroundColor
{
    return [UIColor colorFromHexString:kIncomeGrayBackgroundColorString];
}

- (UIColor *)incomeGraySlideColor
{
    return [UIColor colorFromHexString:kIncomeGraySlideColorString];
}

- (UIColor *)tradeRecordPinkTitleColor
{
    return [UIColor colorFromHexString:kTradeRecordPinkTitleColor];
}
- (UIColor *)tradeRecordGrayTitleColor
{
    return [UIColor colorFromHexString:kTradeRecordGrayTitleColor];
}

- (UIColor *)tradeRecordHorizenSlideColor
{
    return [UIColor colorFromHexString:kTradeRecordHorizenSlideColor];
}

- (UIColor *)yellowButtonColor
{
    return [UIColor colorFromHexString:kYellowButtonColor];
}

- (UIColor *)grayTitleColor
{
    return [UIColor colorFromHexString:kGrayTitleColor];
}

- (UIColor *)orangeTitleColor
{
    return [UIColor colorFromHexString:kOrangeTitleColor];
}

- (UIColor *)checkTicketNumberGrayColor
{
    return [UIColor colorFromHexString:KCheckTicketNumberGrayColor];
}

@end
