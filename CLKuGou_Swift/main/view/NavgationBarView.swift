//
//  NavgationBarView.swift
//  CLKuGou_Swift
//
//  Created by Darren on 16/8/6.
//  Copyright © 2016年 darren. All rights reserved.
//

import UIKit

class NavgationBarView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.titleLable)
        self.addSubview(self.navLine)
        self.backgroundColor = NavBackGroundColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var titleLable:UILabel = {
       let titleLable = UILabel()
        titleLable.textAlignment = .Center
        titleLable.textColor = NavTitleColor()
        titleLable.font = NavTitleFont
        return titleLable;
    }()
    private lazy var navLine:UILabel = {
        let navLine = UILabel()
        navLine.backgroundColor = UIColor.grayColor()
        return navLine;
    }()
    
    override func layoutSubviews() {
        self.titleLable.frame = CGRectMake(0, 20, APPW, 64-20);
        self.navLine.frame = CGRectMake(0, 64, APPW, 0.26);
    }
}
