//
//  MainTabBarController.m
//  HaiDian
//
//  Created by 嗨客－孙兴国 on 15/8/27.
//  Copyright (c) 2015年 haike_sunxingguo. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomePageViewController.h"
#import "SelectionViewController.h"
#import "AboutMeViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
    NSArray *familyNames = [UIFont familyNames];
    for( NSString *familyName in familyNames ){
        printf( "Family: %s \n", [familyName UTF8String] );
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for( NSString *fontName in fontNames ){
            printf( "\tFont: %s \n", [fontName UTF8String] );
        }
    }
     */
    
    [self createViewControllers];//向分栏视图控制器中添加视图控制器
    
    [self createTabBarBackgroundImage];
    
    [self createTabBarItem];
}

#pragma mark 添加视图控制器
- (void)createViewControllers{
    //创建三个导航视图控制器，每个导航中有一个根视图控制器
    HomePageViewController *homePageViewController = [[HomePageViewController alloc] init];
    homePageViewController.title = @"首页";
    UINavigationController *homePageNavigationController = [[UINavigationController alloc] initWithRootViewController:homePageViewController];
    
    SelectionViewController *selectionViewController = [[SelectionViewController alloc] init];
    selectionViewController.title = @"精选";
    UINavigationController *selectionNavigationController = [[UINavigationController alloc] initWithRootViewController:selectionViewController];
    
    AboutMeViewController *aboutMeViewController = [[AboutMeViewController alloc] init];
    aboutMeViewController.title = @"我的";
    UINavigationController *aboutMeNavigationController = [[UINavigationController alloc] initWithRootViewController:aboutMeViewController];
    
    //设置分栏视图控制器中的视图控制器
    self.viewControllers = @[homePageNavigationController, selectionNavigationController, aboutMeNavigationController];
}

- (void)createTabBarBackgroundImage{
    //设置背景图片
    self.tabBar.shadowImage = [[UIImage alloc] init];//消除阴影线
}

- (void)createTabBarItem{
    
    //设置显示的title
    NSArray *titleArray = @[@"首页", @"精选", @"我的"];
    //设置选择时显示的图片
    NSArray *selectedImageName = @[@"home_hover@2x", @"choice_hover@2x", @"profile_hover@2x"];
    //设置未选择时显示的图片
    NSArray *unSelectedImageName = @[@"home_normal@2x", @"choice_normal@2x", @"profile_normal@2x"];
    
    //设置tabbar背景颜色
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49)];
    backView.backgroundColor = [UIColor blackColor];
    [self.tabBarController.tabBar insertSubview:backView atIndex:0];
    self.tabBarController.tabBar.opaque = YES;
    
    for (int i = 0; i < 3; i++) {
        //items数组成员个数和容器中视图控制器个数决定
        //NSLog(@"%lu", (unsigned long)self.tabBar.items.count);
        UITabBarItem *item = self.tabBar.items[i];
        
        UIImage *selectedImage = [UIImage imageNamed:selectedImageName[i]];
        UIImage *unSelectedImage = [UIImage imageNamed:unSelectedImageName[i]];
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        unSelectedImage = [unSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item = [item initWithTitle:titleArray[i] image:unSelectedImage selectedImage:selectedImage];
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, FONT_YAHEI(10), NSFontAttributeName, nil] forState:UIControlStateNormal];
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, FONT_YAHEI(10), NSFontAttributeName, nil] forState:UIControlStateHighlighted];
    }
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
