//
//  ViewController.swift
//  二维码
//
//  Created by czljcb on 16/3/13.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit
import CoreImage
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.image = UIImage.QRCodeImageWith("http://www.baidu.com", withSize: 300.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let filter =  CIFilter(name: "CIQRCodeGenerator");
        filter?.setDefaults()
        let dataStr = "json"
        
        let data = dataStr.dataUsingEncoding(NSUTF8StringEncoding)
        
        filter?.setValue(data, forKeyPath: "inputMessage")
        
        let cgimage = filter?.outputImage
        imageView.image = self.createNonInterpolatedUIImageFormCIImage(cgimage!, size: 300)
        //imageView.image = UIImage.createNonInterpolatedUIImageFormCIImage(cgimage, withSize: imageView.frame.size.width)
    }
    
    func createNonInterpolatedUIImageFormCIImage(image:CIImage , size: CGFloat) -> UIImage{
        
        let extent = CGRectIntegral(image.extent)
        let scale = min(size / CGRectGetWidth(extent), size / CGRectGetHeight(extent))
        // 1.创建bitmap;
        let width = CGRectGetWidth(extent) * scale
        let height = CGRectGetHeight(extent) * scale
        let cs = CGColorSpaceCreateDeviceGray()
        let bitmapRef = CGBitmapContextCreate(nil,Int(width),Int(height), 8, 0, cs, 0)
        
        let context = CIContext(options: nil)
        
        let bitmapImage = context.createCGImage(image, fromRect: extent)
        CGContextSetInterpolationQuality(bitmapRef, CGInterpolationQuality.None)
        CGContextScaleCTM(bitmapRef, scale, scale);
        CGContextDrawImage(bitmapRef, extent, bitmapImage);

        let scaledImage = CGBitmapContextCreateImage(bitmapRef);
        
        CGContextFlush(bitmapRef)
        CGImageIsMask(bitmapImage)
        return UIImage(CGImage: scaledImage!)

    }
    
   
    
}

