//
//  CLAnimatedTransitioning.swift
//  CLKuGou_Swift
//
//  Created by Darren on 16/8/9.
//  Copyright © 2016年 darren. All rights reserved.
//

import UIKit

class CLAnimatedTransitioning: NSObject,UIViewControllerAnimatedTransitioning {
    var presented = true;
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        if self.presented {
            let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
            toView!.transform = CGAffineTransformMakeScale(0.8, 0.8)
            UIView.animateWithDuration(0.2, animations: {
                toView!.transform = CGAffineTransformIdentity;

                }, completion: { (true) in
                    transitionContext.completeTransition(true)
            })
        } else {
            let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
            fromView!.transform = CGAffineTransformMakeScale(0.8, 0.8)
            UIView.animateWithDuration(0.2, animations: {
                fromView!.transform = CGAffineTransformMakeScale(0.8, 0.8)
                
                }, completion: { (true) in
                    fromView!.transform = CGAffineTransformIdentity;
                    transitionContext.completeTransition(true)
            })
        }
    }
}
