//
//  SelectionViewController.m
//  HaiDian
//
//  Created by 嗨客－孙兴国 on 15/8/29.
//  Copyright (c) 2015年 haike_sunxingguo. All rights reserved.
//

#import "SelectionViewController.h"

@interface SelectionViewController () <UITableViewDataSource, UITableViewDelegate> {

    NSMutableArray *_selectionTableViewDataArr;
}

@end

@implementation SelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _selectionTableView.dataSource = self;
    _selectionTableView.delegate = self;
    
    [_selectionTableView registerNib:[UINib nibWithNibName:@"SelectionTableViewCell" bundle:nil] forCellReuseIdentifier:@"identifier_selectionTableViewCell"];
    
    _selectionTableViewDataArr = [[NSMutableArray alloc] init];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    SelectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier_selectionTableViewCell"];
    
    if (cell == nil) {
        cell = [[SelectionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier_selectionTableViewCell"];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 191;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
