//
//  CoustomPresentationController.swift
//  CLKuGou_Swift
//
//  Created by Darren on 16/8/9.
//  Copyright © 2016年 darren. All rights reserved.
//

import UIKit

class CoustomPresentationController: UIPresentationController {

    override func presentationTransitionWillBegin() {
        self.presentedView()?.frame = CGRectMake(0, 0,APPW, APPH)
        self.containerView?.addSubview(self.presentedView()!)
        
        self.containerView?.addSubview(self.presentingViewController.view)
        
        UIView.animateWithDuration(0.2) { 
            self.presentingViewController.view.cl_x = APPW-50;
            self.presentingViewController.view.cl_y = 100;
            self.presentingViewController.view.cl_height = APPH-200;
        }
    }
    
    override func dismissalTransitionWillBegin() {
        UIApplication.sharedApplication().keyWindow?.addSubview(self.presentingViewController.view)
        UIView.animateWithDuration(0.5) {
            self.presentingViewController.view.cl_x = 0;
            self.presentingViewController.view.cl_y = 0;
            self.presentingViewController.view.cl_height = APPH;
        }
    }
    
    override func presentationTransitionDidEnd(completed: Bool) {
        
    }
    
    override func dismissalTransitionDidEnd(completed: Bool) {
        presentedView()?.removeFromSuperview()
    }
}
