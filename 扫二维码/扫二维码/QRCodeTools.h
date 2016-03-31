//
//  QRCodeTools.h
//  扫二维码
//
//  Created by czljcb on 16/3/13.
//  Copyright © 2016年 czljcb. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@interface QRCodeTools : NSObject
- (void)QRCodeWithView:(UIView *)view callBack:(void(^)(NSString*))block;
+ (instancetype)sharedQRCodeTools;
@end
