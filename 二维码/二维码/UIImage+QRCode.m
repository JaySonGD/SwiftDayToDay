//
//  UIImage+QRCode.m
//  二维码
//
//  Created by czljcb on 16/3/13.
//  Copyright © 2016年 czljcb. All rights reserved.
//

#import "UIImage+QRCode.h"
#import <CoreImage/CoreImage.h>

@implementation UIImage (QRCode)

+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

+ (UIImage *)QRCodeImageWith:(NSString *)string withSize:(CGFloat) size

{
    CIFilter *filer = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filer setDefaults];
    
    [filer setValue:[string dataUsingEncoding:NSUTF8StringEncoding] forKeyPath:@"inputMessage"];
    
    CIImage *image = [filer outputImage];
    
    return [self createNonInterpolatedUIImageFormCIImage:image withSize:size];

}

@end
