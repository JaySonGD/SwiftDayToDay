//
//  QRCodeTools.m
//  扫二维码
//
//  Created by czljcb on 16/3/13.
//  Copyright © 2016年 czljcb. All rights reserved.
//

#import "QRCodeTools.h"

@interface QRCodeTools () <AVCaptureMetadataOutputObjectsDelegate>
@property (nonatomic, weak) AVCaptureSession * session;
@property (nonatomic, weak) AVCaptureVideoPreviewLayer *layer;
@property (nonatomic, copy) void(^QRCodeBlock)(NSString*);
@end


@implementation QRCodeTools

static QRCodeTools *_instance;

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [super allocWithZone:zone];
        
    });
    return _instance;
}

- (instancetype)copyWithZone:(NSZone *)zone{return _instance;}

- (instancetype)mutableCopyWithZone:(NSZone *)zone{return _instance;}

+ (instancetype)sharedQRCodeTools{return [[self alloc] init];}


- (void)QRCodeWithView:(UIView *)view callBack:(void(^)(NSString*))block
{
    AVCaptureSession * session = [[AVCaptureSession alloc] init];
    _session = session;
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput * inPut = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil ];
    [session addInput:inPut];
    
    AVCaptureMetadataOutput *outPut = [[AVCaptureMetadataOutput alloc] init];
    [outPut setMetadataObjectsDelegate:(self) queue:dispatch_get_main_queue()];
    [session addOutput:outPut];
    [outPut setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    
    AVCaptureVideoPreviewLayer *layer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    _layer = layer;
    layer.frame = view.bounds;
    [view.layer addSublayer:layer];
    [session startRunning];
    _QRCodeBlock = block;
    
    NSLog(@"%@",NSStringFromCGRect(layer.frame));

}


- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    if (metadataObjects.count > 0) {
        
        [_session stopRunning];
        [_layer removeFromSuperlayer];
        AVMetadataMachineReadableCodeObject * object = metadataObjects.firstObject;
//        NSLog(@"%@",object.stringValue);
        
        _QRCodeBlock(object.stringValue);
        
    }
}

@end
