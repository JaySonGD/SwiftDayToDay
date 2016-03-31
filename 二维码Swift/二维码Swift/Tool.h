//
//  Tool.h
//  二维码Swift
//
//  Created by czljcb on 16/3/19.
//  Copyright © 2016年 lQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Tool : NSObject
+ (UIImage *)generateBarCode:(NSString *)code size:(CGSize)size color:(UIColor *)color backGroundColor:(UIColor *)backGroundColor;


+ (UIImage *)qrImageWithString:(NSString *)string size:(CGSize)size color:(UIColor *)color backGroundColor:(UIColor *)backGroundColor
;
@end
