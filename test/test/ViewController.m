//
//  ViewController.m
//  test
//
//  Created by czljcb on 16/3/13.
//  Copyright © 2016年 czljcb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 44)];
    lable.text = @"eeeee";
    lable.font = [UIFont systemFontOfSize:45];
    [self.view addSubview:lable];
    
    
}



- (void)injected{
    NSLog(@"I've been injected: %@", self);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
