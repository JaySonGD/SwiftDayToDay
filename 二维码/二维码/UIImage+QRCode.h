//
//  UIImage+QRCode.h
//  二维码
//
//  Created by czljcb on 16/3/13.
//  Copyright © 2016年 czljcb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QRCode)
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size;
+ (UIImage *)QRCodeImageWith:(NSString *)string withSize:(CGFloat) size;

@end
