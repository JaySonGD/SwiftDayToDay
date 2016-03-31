//
//  ViewController.m
//  frameworkTest
//
//  Created by czljcb on 16/3/18.
//  Copyright © 2016年 lQ. All rights reserved.
//

#import "ViewController.h"
#import <framework/libTool.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [libTool log];
}
@end
