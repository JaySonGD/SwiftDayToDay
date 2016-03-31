//
//  ViewController.m
//  静态内存分析
//
//  Created by czljcb on 16/3/18.
//  Copyright © 2016年 lQ. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *p = [[Person alloc] init];
    
    NSLog(@"%@",p);
    
    [p release];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
