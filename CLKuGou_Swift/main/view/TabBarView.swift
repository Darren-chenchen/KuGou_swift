//
//  TabBarView.swift
//  CLKuGou_Swift
//
//  Created by Darren on 16/8/6.
//  Copyright © 2016年 darren. All rights reserved.
//

import UIKit

class TabBarView: UIView {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var slideView: UISlider!
    @IBOutlet weak var songLable: UILabel!
    @IBOutlet weak var singerlable: UILabel!
    @IBOutlet weak var starBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var menuBtn: UIButton!
    
    class func show() -> TabBarView{
        return NSBundle.mainBundle().loadNibNamed(String(self), owner: nil, options: nil).last as! TabBarView
    }
    
    override func awakeFromNib() {
        self.slideView.setThumbImage(UIImage(named: "slider"), forState:.Normal)
        
        CLViewsBorder(self.iconView, borderWidth: 1, borderColor: UIColor.grayColor(), cornerRadius: self.iconView.cl_width*0.5)
    }
}
