//
//  CLPresent.swift
//  CLKuGou_Swift
//
//  Created by Darren on 16/8/9.
//  Copyright © 2016年 darren. All rights reserved.
//

import UIKit

class CLPresent: NSObject,UIViewControllerTransitioningDelegate {

    class var sharedCLPresent: CLPresent {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: CLPresent? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = CLPresent()
        }
        return Static.instance!
    }
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        let customPresent = CoustomPresentationController.init(presentedViewController: presented,presentingViewController: presenting)
        return customPresent
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animation = CLAnimatedTransitioning()
        animation.presented = true
        return animation
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animation = CLAnimatedTransitioning()
        animation.presented = false
        return animation
    }
}
