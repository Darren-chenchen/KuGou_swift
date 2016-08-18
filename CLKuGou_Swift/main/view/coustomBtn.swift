//
//  coustomBtn.swift
//  CLKuGou_Swift
//
//  Created by Darren on 16/8/16.
//  Copyright © 2016年 darren. All rights reserved.
//

import UIKit

class coustomBtn: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        self.titleLabel?.textAlignment = NSTextAlignment.Center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        let imageW = self.cl_width-10
        let imageX = (self.cl_width-imageW)*0.5
        let imageH = self.cl_height-35
        let imageY:CGFloat = 0.0
    
        return CGRectMake(imageX, imageY, imageW, imageH)

    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        let titleW = self.frame.size.width;
        let titleX:CGFloat = 0;
        let titleY = self.cl_height - 25;
        let titleH:CGFloat = 25;
    
        return CGRectMake(titleX, titleY, titleW, titleH);
    }
}
