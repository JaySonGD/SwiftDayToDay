//
//  ViewController.m
//  加速计iOS4--
//
//  Created by czljcb on 16/3/15.
//  Copyright © 2016年 czljcb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAccelerometerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
    accelerometer.delegate = self;
    
}

 - (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    NSLog(@"%@",acceleration);
}

@end
