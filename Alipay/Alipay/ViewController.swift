//
//  ViewController.swift
//  Alipay
//
//  Created by czljcb on 16/3/16.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    


    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // 以后再开发当中, 就是先获取一个商品, 然后在对对应的商品进行加密一个订单, 然后再把订单提交给支付宝进行付款
        
        
        // 以下三个参数, 必须是我们商户与支付宝签约之后, 获取到的partner , 才能有"收款功能",
        // 此处仅仅是拿个人账号做测试, 支付不会成功, 会提示(该商户没有开通收款功能...)
        let partner = "2088402263917341";
        // 支付宝收款的账号()
        let seller = "18588630902";
        let privateKey = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMUPORePObMrJ8lmaMVGZ+g3jFebQjQ2kX/dubHAVoEhBa/rsHv2P050LszwvppzPrirwcaql1FhnlSRBgVKtAkyx3l/EqtdZ2QL2+SF1xW2vVy+DmpjE9kc3CypPbnK7l46B5hX1RuGEcStCTWsqHpq+uMCfZ9x7drU2nCiQmzBAgMBAAECgYBf69oRksE2apJSYcwsAup/SdLBriyat9k5UZebY5F4B7f5+xMMNEB6kulZDvLowaJNSCXp643+qjLk3Tb+Cm/5kp2uib/GxMDfXtdKzC5gD7rN4O4ve9+Qj0lRgx7gYQSAEf/bLC909HoWoG98j+QXS5k027RKgfhmFKmst+THAQJBAPb0mAhle4H1z04PnKk2KyjRH3qXr71po2YbRS1p8C4SBkUaF47kNFYCMk7ZXLQ2nXrVQB6B8ByjmrSke3EqxlECQQDMRtBsZOlEPiYfF/tXX/xDq4/2JOFsMNCWEcOVyuJOVKrI9dboM2Eugv3z22b9p9pCoVPKYfvS3w3wJN6vgvNxAkA4kWaR5c0Yw9mso97a09GnE+AGEODsnloTdYOvF2kw5GgTRBrJXHSwjug/L4MQtMH19Qsu8cyygrdZUaQFFCtBAkAoVvulzC+8iEFi9ott78iTXHfrddEGWoV2fT+QfyY9rb6kPNgZtrvEQZ4A4BzwjostiUpQtxTRybao678GDeghAkEA1vO5ZcMMDzJBHhpePOts824vSDiCmXfQpeFaZje3NcPvzcWtv/89+SUerFYVE4SPwfLgr29IMRHWuQ8z6AJc5A==";
        
        
        
        /*
        *生成订单信息及签名
        */
        
        let order = Order()
        order.partner = partner;
        order.seller = seller;
        order.tradeNO = "20142345235, 具体是根据公司规定来的" //订单ID（由商家自行制定）
        order.productName = "苹果7s" //商品标题
        order.productDescription = "可以拨打110, 10086, 都可以"//商品描述
        order.amount = "998" //商品价格
        order.notifyURL =  "http://www.520it.com"; //回调URL, 这个参数是以后, 服务器后台人员给定的
        
        
        /**
        *  以下参数都是固定写法
        */
        order.service = "mobile.securitypay.pay" // 接口名称
        order.paymentType = "1"  // 支付类型
        order.inputCharset = "utf-8" // 参数编码字符集
        order.itBPay = "30m" // 未付款交易的超时时间
        order.showUrl = "m.alipay.com"
        
        // 设置本APP的scheme, 这里, 必须保证与我们App的sheme一致
        let appScheme = "jiuqiPay"
        
        
        let orderSpec = order.description
        
        
        //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
        let signer = CreateRSADataSigner(privateKey);
        let signedString = signer.signString(orderSpec)
        
        
        
        //将签名成功字符串格式化为订单字符串,请严格按照该格式
        let orderString: String?
        if (signedString != nil) {
            
            orderString = orderSpec + "&sign=\"" + signedString + "\"&sign_type=\"RSA\""
            
            
            AlipaySDK.defaultService().payOrder(orderString, fromScheme: appScheme, callback: { (resultDic: [NSObject : AnyObject]!) -> Void in
                print(resultDic)
            })
            
            
        }
        
        
    }
    
    
    

    
}

