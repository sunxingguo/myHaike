//
//  SelectionViewController.h
//  HaiDian
//
//  Created by 嗨客－孙兴国 on 15/8/29.
//  Copyright (c) 2015年 haike_sunxingguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "SelectionTableViewCell.h"
#import "SelectionTableViewModel.h"

@interface SelectionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *selectionTableView;

@end
