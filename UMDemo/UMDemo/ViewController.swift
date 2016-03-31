//
//  ViewController.swift
//  UMDemo
//
//  Created by czljcb on 16/3/16.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //注意：分享到微信好友、微信朋友圈、微信收藏、QQ空间、QQ好友、来往好友、来往朋友圈、易信好友、易信朋友圈、Facebook、Twitter、Instagram等平台需要参考各自的集成方法
     
        // MARK: - 各平台分享
//        UMSocialSnsService.presentSnsIconSheetView(self, appKey: "56e97ab667e58e2aaf003278", shareText: "来自友们分享", shareImage: nil, shareToSnsNames:[UMShareToSina,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToWechatFavorite,UMShareToQQ,UMShareToQzone], delegate: nil)
        
        
        // MARK: - 微博登录
//        let snsPlatform: UMSocialSnsPlatform = UMSocialSnsPlatformManager.getSocialPlatformWithName(UMShareToSina)
//        
//        snsPlatform.loginClickHandler!(self,UMSocialControllerService.defaultControllerService(),true,{
//            (response) -> ()
//            in
//            if (response.responseCode == UMSResponseCodeSuccess) {
//                let snsAccount = UMSocialAccountManager.socialAccountDictionary()[UMShareToSina]
//                
//                guard let account: UMSocialAccountEntity = snsAccount as? UMSocialAccountEntity else{
//                    return
//                }
//                
//                print(account.userName )
//            }
//            
//        })
        
        
        let snsPlatform: UMSocialSnsPlatform = UMSocialSnsPlatformManager.getSocialPlatformWithName(UMShareToQQ)
        
        snsPlatform.loginClickHandler!(self,UMSocialControllerService.defaultControllerService(),true,{
            (response) -> ()
            in
            if (response.responseCode == UMSResponseCodeSuccess) {
                let snsAccount = UMSocialAccountManager.socialAccountDictionary()[UMShareToQQ]
                
                guard let account: UMSocialAccountEntity = snsAccount as? UMSocialAccountEntity else{
                    return
                }
                
                print(account.userName )
            }
            
        })
    }
    

}

