//
//  ViewController.m
//  demo
//
//  Created by czljcb on 16/3/19.
//  Copyright © 2016年 lQ. All rights reserved.
//

#import "ViewController.h"
#import "PhotoTool.h"

@interface ViewController ()

@end

@implementation ViewController


//条码或二维码识别
- (void)viewDidLoad{
    [super viewDidLoad];    //带二维码或条码的照片
    
    
    UIImage *image=[UIImage imageNamed:@"A57F5220208BB14778015EAB2941BABB"];
    [PhotoTool writeToSavedPhotosAlbum:image];
    NSArray *features=[self detectQRCode:image];    //可能会存在多个二维码，这里只考虑一个的情况
    if(features.count>0)    {
        //CIQRCodeFeature *code=[features firstObject];
        //NSLog(@"识别结果:%@",code.messageString);
    }}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**从图片中识别二维码*/
-(NSArray *)detectQRCode:(UIImage *)qrcodeImage{
    NSDictionary *opts=@{CIDetectorAccuracy:CIDetectorAccuracyHigh};
    CIDetector *detector=[CIDetector detectorOfType:CIDetectorTypeRectangle context:nil options:opts];
    CIImage *cimage=[CIImage imageWithCGImage:qrcodeImage.CGImage];
    NSArray *features=[detector featuresInImage:cimage];
    return features;
}

@end
