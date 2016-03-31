//
//  ViewController.m
//  广告
//
//  Created by czljcb on 16/3/13.
//  Copyright © 2016年 czljcb. All rights reserved.
//

#import "ViewController.h"
#import <iAd/iAd.h>

@interface ViewController () <ADBannerViewDelegate>
@property (weak, nonatomic) IBOutlet ADBannerView *adView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomCon;

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

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    NSLog(@"%s", __func__);
    self.bottomCon.constant = 0;
    
    [UIView animateKeyframesWithDuration:5 delay:0 options:0 animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    
}
@end
