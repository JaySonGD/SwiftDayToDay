//
//  MRClib.m
//  MRClib
//
//  Created by czljcb on 16/3/18.
//  Copyright © 2016年 lQ. All rights reserved.
//

#import "MRClib.h"

@implementation MRClib
+(void)log
{
    NSObject *obj = [[NSObject alloc] init];
    NSString *str = @"MRC下静态库";
    NSLog(@"%@--%@",str,obj);
    [obj release];
}
@end
