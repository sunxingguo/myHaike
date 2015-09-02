//
//  HomePageTableViewCell.m
//  HaiDian
//
//  Created by 嗨客－孙兴国 on 15/8/28.
//  Copyright (c) 2015年 haike_sunxingguo. All rights reserved.
//

#import "HomePageTableViewCell.h"

@implementation HomePageTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    /*
    _addressLabel.font = FONT_YAHEI(14);
    _titleLabel.font = FONT_YAHEI(16);
    _distanceLabel.font = FONT_YAHEI(12);
    
    _portraitImage.layer.masksToBounds = YES;
    _portraitImage.layer.cornerRadius = _portraitImage.frame.size.width / 2;
    _portraitImage.layer.borderWidth = 1;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace, (CGFloat[]){ 1, 1, 1, 1 });
    _portraitImage.layer.borderColor = colorref;
     */
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
