//
//  ViewController.m
//  动态内存分析
//
//  Created by czljcb on 16/3/18.
//  Copyright © 2016年 lQ. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Dog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    Person *p = [[Person alloc] init];
    Dog *d = [[Dog alloc] init];
    
    p.dog = d;
    d.person = p;
}

@end
