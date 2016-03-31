//
//  PhotoTool.m
//  
//
//  Created by czljcb on 16/3/4.
//
//

#import "PhotoTool.h"

@implementation PhotoTool

+ (void)writeToSavedPhotosAlbum:(UIImage * )image
{
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    switch (status) {
            // User has not yet made a choice with regards to this application
            // 用户还没有对当前App进行授权（还没有弹框让用户做过选择）
        case PHAuthorizationStatusNotDetermined: {
            // 弹框让用户做出选择
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus justNowStatus) {
                // 在用户做出选择以后就会自动调用这个block
                // 传进来的status参数就是用户刚才做的选择
                if (justNowStatus == PHAuthorizationStatusDenied) {
                    NSLog(@"用户点击了“Don't Allow”");
                } else if (justNowStatus == PHAuthorizationStatusAuthorized) {
                    [self saveImage : image];
                    
                }
            }];
            break;
        }
            
            // User has explicitly denied this application access to photos data.
            // 用户不允许当前App访问相册（之前在弹框时，用户点击了“Don't Allow”\“不允许”）
        case PHAuthorizationStatusDenied: {
            // 提醒用户打开相册的访问开关：设置-隐私-照片-App名字
            NSLog(@"提醒用户打开相册的访问开关：设置-隐私-照片-App名字");
            break;
        }
            
            // User has authorized this application to access photos data.
            // 用户允许当前App访问相册（之前在弹框时，用户点击了“OK”\“好”）
        case PHAuthorizationStatusAuthorized: {
            [self saveImage: image];
            break;
        }
            
            // This application is not authorized to access photo data.
            // The user cannot change this application’s status, possibly due to active restrictions such as parental controls being in place.
            // 系统级别的限制，导致当前App无法访问相册（用户也无法改变这种状态）
        case PHAuthorizationStatusRestricted: {
            //[SVProgressHUD showErrorWithStatus:@"因为系统原因，无法保存图片！"];
            
            
            break;
        }
    }
}

/**
 *  保存图片
 */
+  (void)saveImage:(UIImage* ) image
{
    NSError *error = nil;
    
    // 保存图片到【Camera Roll（相机胶卷）】中
    __block NSString *assetId = nil;
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        assetId = [PHAssetChangeRequest creationRequestForAssetFromImage: image].placeholderForCreatedAsset.localIdentifier;
    } error:&error];
    PHFetchResult<PHAsset *> *assets = [PHAsset fetchAssetsWithLocalIdentifiers:@[assetId] options:nil];
    
    // 获得App的名称
    NSString *title = [NSBundle mainBundle].infoDictionary[(__bridge NSString *)kCFBundleNameKey];
    // 检测有没有创建过相册
    PHAssetCollection *createdCollection = nil;
    PHFetchResult<PHAssetCollection *> *collections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    for (PHAssetCollection *collection in collections) {
        if ([collection.localizedTitle isEqualToString:title]) {
            createdCollection = collection;
            break;
        }
    }
    // 没有创建过相册
    if (createdCollection == nil) {
        // 创建【自定义相册】
        __block NSString *collectionId = nil;
        [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
            collectionId = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:title].placeholderForCreatedAssetCollection.localIdentifier;
        } error:&error];
        createdCollection = [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[collectionId] options:nil].firstObject;
    }
    
    // 将刚才保存到【Camera Roll（相机胶卷）】中的图片，引用（添加）到【自定义相册】
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        PHAssetCollectionChangeRequest *request = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:createdCollection];
        [request insertAssets:assets atIndexes:[NSIndexSet indexSetWithIndex:0]];
    } error:&error];
    
    // 提示
    if (error) {
        //[SVProgressHUD showErrorWithStatus:@"保存失败！"];
    } else {
        //[SVProgressHUD showSuccessWithStatus:@"保存成功！"];
        
    }
}


+ (void)showErrorWithStatus:(NSString*)str{
    
    //UIView *aler
}

@end
