//
//  ViewController.swift
//  行为动画
//
//  Created by czljcb on 16/3/15.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var  animator : UIDynamicAnimator = {
        
        return UIDynamicAnimator(referenceView: self.view)
    }()
    
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var view2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // MARK: - 捕捉
        let touch = touches.first
        let point = touch?.locationInView(touch?.view)
        let item = view1
        
        let behavior =  UISnapBehavior(item: item, snapToPoint: point!)
        behavior.damping = 0.8
        
        animator.addBehavior(behavior)
    }
    
    // MARK: - 推
    func pushBehavior(){
        let item = view1
        //        case Continuous
        //        case Instantaneous
        let behavior = UIPushBehavior(items: [item], mode: UIPushBehaviorMode.Continuous)
        behavior.pushDirection = CGVector(dx: 10, dy: 10)
        animator.addBehavior(behavior)
    }
    
    // MARK: - 碰撞
    func collisionBehavior(){
        let item = view2
        let item2 = view1
        let behavior = UICollisionBehavior(items: [item ,item2])
        //        public static var Items: UICollisionBehaviorMode { get }
        //        public static var Boundaries: UICollisionBehaviorMode { get }
        //        public static var Everything: UICollisionBehaviorMode
        behavior.collisionMode = UICollisionBehaviorMode.Everything
        behavior.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(behavior)
        
    }
    
    // MARK: - 重力
    func gravityBehavior(){
        let item = view1
        let behavior = UIGravityBehavior(items: [item])
        behavior.magnitude = 0.2
        animator.addBehavior(behavior)
        
    }
    
    
}

