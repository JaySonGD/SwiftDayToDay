//
//  ViewController.m
//  demo11
//
//  Created by czljcb on 16/3/25.
//  Copyright © 2016年 lQ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UISearchResultsUpdating>
@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.searchResultsUpdater = self;
    //设置UISearchController的显示属性，以下3个属性默认为YES
    //搜索时，背景变暗色
    _searchController.dimsBackgroundDuringPresentation = NO;
    //搜索时，背景变模糊
    _searchController.obscuresBackgroundDuringPresentation = NO;
    //隐藏导航栏
    _searchController.hidesNavigationBarDuringPresentation = NO;

    _searchController.searchBar.frame =  CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44.0);
;//CGRectMake(0,0, 375, 44.0);
    
//    self.navigationItem.titleView = self.searchController.searchBar;
//    [self.searchController.searchBar setBackgroundImage:nil forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    self.searchController.searchBar.placeholder = @"eeee";
    self.searchController.searchBar.barTintColor = [UIColor orangeColor];
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
}

@end
