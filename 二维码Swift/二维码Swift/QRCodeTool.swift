//
//  QRCodeTool.swift
//  二维码Swift
//
//  Created by czljcb on 16/3/19.
//  Copyright © 2016年 lQ. All rights reserved.
//

import UIKit

class QRCodeTool: NSObject {
    
    
    
}

// ********************************************************************************************************
// MARK: - < 生成二维码 >
extension QRCodeTool{
    
    
    class func imageWiteQRCode(text: String ,imageSize: CGFloat,logoImage: UIImage?,logoSzie: CGFloat) -> UIImage{
        
        let data = text.dataUsingEncoding(NSUTF8StringEncoding)
        
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        filter?.setDefaults()
        
        filter?.setValue(data, forKey: "inputMessage")
        
        // 设置二维码的纠错率 inputCorrectionLevel
        // L, M, Q, H
        filter?.setValue("H", forKey: "inputCorrectionLevel")
        
        let imageCI = filter?.outputImage
        
        let image = createBigImage(imageCI!, size: imageSize)
        
        if logoImage == nil{
            return image
        }
        
        return imageWithLogoImage(image, logoImage: logoImage!, logoSize: logoSzie)
    }
    
    
    class private func imageWithLogoImage(image: UIImage,logoImage: UIImage,logoSize: CGFloat) -> UIImage{
        
        UIGraphicsBeginImageContext(image.size)
        
        image.drawInRect(CGRect(origin: CGPointZero, size: image.size))
        
        logoImage.drawInRect(CGRect(x: (image.size.width  - logoSize ) * 0.5, y:  (image.size.height  - logoSize ) * 0.5, width: logoSize, height: logoSize))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
    }
    
    /**
     根据CIImage生成指定大小的高清UIImage
     :param: image 指定CIImage
     :param: size    指定大小
     :returns: 生成好的图片
     */
    class  private  func createBigImage(image: CIImage, size: CGFloat) -> UIImage {
        
        let extent: CGRect = CGRectIntegral(image.extent)
        let scale: CGFloat = min(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent))
        
        // 1.创建bitmap;
        let width = CGRectGetWidth(extent) * scale
        let height = CGRectGetHeight(extent) * scale
        let cs: CGColorSpaceRef = CGColorSpaceCreateDeviceGray()!
        let bitmapRef = CGBitmapContextCreate(nil, Int(width), Int(height), 8, 0, cs, 0)!
        
        let context = CIContext(options: nil)
        let bitmapImage: CGImageRef = context.createCGImage(image, fromRect: extent)
        
        CGContextSetInterpolationQuality(bitmapRef,  CGInterpolationQuality.None)
        CGContextScaleCTM(bitmapRef, scale, scale);
        CGContextDrawImage(bitmapRef, extent, bitmapImage);
        
        // 2.保存bitmap到图片
        let scaledImage: CGImageRef = CGBitmapContextCreateImage(bitmapRef)!
        
        return UIImage(CGImage: scaledImage)
    }
    
}


// ********************************************************************************************************
// MARK: - < 从图片中扫二维码 >
extension QRCodeTool{
    
    class func QRCodeWithImage(sourceImage: UIImage) -> (contents: [String],image: UIImage)?{
        
        let context = CIContext()
        
        let detector = CIDetector(ofType: CIDetectorTypeQRCode, context: context, options: [CIDetectorAccuracy : CIDetectorAccuracyHigh])
        
        
        let imageCI = CIImage(image: sourceImage)
        
        let features = detector.featuresInImage(imageCI!)
        
        
        
        guard let tempFeatrues : [CIQRCodeFeature] =  features as?  [CIQRCodeFeature]  else{
            return nil
        }
        
        
        var tempImage = sourceImage
        var title:String = ""
        var titleArray = [String]()
        for feature in tempFeatrues{
            
            tempImage = QRCodeWithFrameImage(tempImage, feature: feature)
            title = feature.messageString + title
            titleArray.append(feature.messageString)
        }
        if title == ""{
            title = "啥都没有扫到,换个姿势吧!"
        }
        
        let alert = UIAlertController(title: "提示", message: title, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "确认", style: UIAlertActionStyle.Default, handler: nil))
        
        
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alert, animated: true, completion: nil)

        return (titleArray,tempImage)
    }
    
   class  private func QRCodeWithFrameImage(image: UIImage,feature: CIQRCodeFeature) -> UIImage{
        
        UIGraphicsBeginImageContext(image.size)
        
        image.drawInRect(CGRect(origin: CGPointZero, size: image.size))
        
        var bounds = feature.bounds
        print(image.size)
        bounds.origin.y = image.size.height -  bounds.origin.y - bounds.size.height
        let path = UIBezierPath(rect: bounds)
        path.lineWidth = 10
        UIColor.orangeColor().setStroke()
        path.stroke()
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return newImage
        
    }
    
}