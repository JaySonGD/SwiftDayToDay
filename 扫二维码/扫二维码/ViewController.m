//
//  ViewController.m
//  扫二维码
//
//  Created by czljcb on 16/3/13.
//  Copyright © 2016年 czljcb. All rights reserved.
//

#import "ViewController.h"
#import "QRCodeTools.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[QRCodeTools sharedQRCodeTools] QRCodeWithView:self.view callBack:^(NSString * string) {
        
        NSLog(@"---%@",string);
    }];

    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    

}

@end
