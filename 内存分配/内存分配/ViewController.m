//
//  ViewController.m
//  内存分配
//
//  Created by czljcb on 16/3/18.
//  Copyright © 2016年 lQ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    // 放在Assets.xcassets, 在iOS7+会对图片压缩
    // 只会加载一次到内存，但不会释放
    // 适合小图，多次反复利用的
    //self.imageView.image = [UIImage imageNamed:@"liudog.jpg"];
    
    // 会反复加载到内存，可以释放，但是不能放在Assets.xcassets,
    // 适合新特性图片，启动图
    self.imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"liudog.jpg" ofType:nil]];
}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.imageView removeFromSuperview];

}

@end
