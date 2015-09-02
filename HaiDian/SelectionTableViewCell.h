//
//  SelectionTableViewCell.h
//  HaiDian
//
//  Created by 嗨客－孙兴国 on 15/8/29.
//  Copyright (c) 2015年 haike_sunxingguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectionTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *main_image;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

@end
