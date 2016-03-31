//
//  PhotoTool.h
//  
//
//  Created by czljcb on 16/3/4.
//
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

@interface PhotoTool : NSObject
+ (void)writeToSavedPhotosAlbum:(UIImage * )image;
@end
