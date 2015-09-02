//
//  SelectionTableViewCell.m
//  HaiDian
//
//  Created by 嗨客－孙兴国 on 15/8/29.
//  Copyright (c) 2015年 haike_sunxingguo. All rights reserved.
//

#import "SelectionTableViewCell.h"

@implementation SelectionTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    _titleLabel.font = FONT_YAHEI(18);
    _subtitleLabel.font = FONT_YAHEI(14);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
