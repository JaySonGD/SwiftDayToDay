//
//  ViewController.m
//  FMDB demo
//
//  Created by czljcb on 16/3/22.
//  Copyright © 2016年 lQ. All rights reserved.
//

#import "ViewController.h"
#import "FMDBTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:@{@"name": @"czljcb"}];
    
    [FMDBTools insert:@"222" data:data];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
   NSLog(@"%@",[FMDBTools dataList]) ;
}

@end
