//
//  HomePageViewController.m
//  HaiDian
//
//  Created by 嗨客－孙兴国 on 15/8/27.
//  Copyright (c) 2015年 haike_sunxingguo. All rights reserved.
//

#import "HomePageViewController.h"

@interface HomePageViewController () <UITableViewDataSource, UITableViewDelegate>{

    UITableView *_homePageTableView;
    
    NSMutableArray *_homePageTableViewDataArr;
}

@property (weak, nonatomic) IBOutlet UIImageView *homePageSearchBarImage;

@property (weak, nonatomic) IBOutlet UITextField *homePageSearchBar;

@property (weak, nonatomic) IBOutlet UIView *homePageCollectionTagView;

@property (weak, nonatomic) IBOutlet UIButton *homePageButton;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBarHidden = YES;
    
    [self createUI];
    
    [self createNetworkRequest];    
}

- (void)createNetworkRequest{

    _homePageTableViewDataArr = [NSMutableArray array];
    
#pragma mark 网络请求
    /*
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    NSDictionary *parameters = @{@"page":@"1", @"lng":@"116.3", @"lat":@"39.9"};
    
    [manager POST:[NSString stringWithFormat:@"%@%@", kBaseUrlStr, kNearbyCourseUrlStr] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
    
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        NSLog(@"数据请求成功ResponseObject: %@", responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        NSLog(@"数据请求失败Error: %@", error);
    }];
     */
    
    DataManager *manager = [DataManager sharedManager];
    
    NSDictionary *parameters = @{@"page": @"1", @"lng": @"116.5561", @"lat": @"39.9"};
    
    [manager PostWithUrl:[NSString stringWithFormat:@"%@%@", kBaseUrlStr, kNearbyCourseUrlStr] withkey:nil withParameters:parameters withRequestSerilize:2 withBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@", responseObject);
    } withFailBlock:^(id error) {
        NSLog(@"请求失败Error: %@", error);
    }];
}

- (void)createUI{
 
    //搜索框旁图片
    _homePageSearchBarImage.layer.masksToBounds = YES;
    _homePageSearchBarImage.layer.cornerRadius = 4;
    
    //搜索框文字
    _homePageSearchBar.font = FONT_YAHEI(14);
    
    NSArray *tagsArray = @[@"少儿兴趣", @"亲子活动", @"手工DIY", @"健身瑜伽", @"成人才艺", @"精彩奇趣"];
    
    //搜索框下面6个tag
    for (int i = 0; i < 6; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(10 + (i % 3) * 105, 14 + (i / 3) * 44, 90, 34);
        [button setTitle:tagsArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = FONT_YAHEI(14);
        
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 4;
        button.layer.borderWidth = 1;
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0.43, 0, 1 });
        button.layer.borderColor = colorref;
        
        button.tag = i + 1;
        [_homePageCollectionTagView addSubview:button];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    //“更多”按钮
    _homePageButton.layer.masksToBounds = YES;
    _homePageButton.layer.cornerRadius = 4;
    _homePageButton.layer.borderWidth = 1;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0.43, 0, 1 });
    _homePageButton.layer.borderColor = colorref;
    
    //首页tableview
    CGRect frame = self.view.frame;
    frame.origin.y = 221;
    frame.size.height -= (221 + 49);
    _homePageTableView = [[UITableView alloc] initWithFrame:frame];
    _homePageTableView.delegate = self;
    _homePageTableView.dataSource = self;
    [self.view addSubview:_homePageTableView];
    
    [_homePageTableView registerNib:[UINib nibWithNibName:@"HomePageTableViewCell" bundle:nil] forCellReuseIdentifier:@"identifier_homePageTableViewCell"];
}

- (void)buttonClick: (UIButton *)button{
    
    NSLog(@"点击了第%ld个标签", button.tag - 1);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    [_homePageSearchBar endEditing:YES];
}

#pragma mark tableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    HomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier_homePageTableViewCell"];
    
    if (cell == nil) {
        cell = [[HomePageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier_homePageTableViewCell"];
    }
    HomePageTableViewModel *model = _homePageTableViewDataArr[indexPath.row];
    
    NSMutableAttributedString *string;
    
    string = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@元", model.price]];
    [string setAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:16], NSFontAttributeName, nil] range:NSMakeRange(0, model.price.length)];
    [string setAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:10], NSFontAttributeName, nil] range:NSMakeRange(model.price.length, 1)];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 195;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
    return _homePageTableViewDataArr.count;
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
