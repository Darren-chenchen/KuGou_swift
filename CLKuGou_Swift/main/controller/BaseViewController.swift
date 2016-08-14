//
//  BaseViewController.swift
//  CLKuGou_Swift
//
//  Created by Darren on 16/8/6.
//  Copyright © 2016年 darren. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    weak var coustomNavBar = NavgationBarView()   // 自定义导航栏
    weak var leftBtn = UIButton()
    weak var rightBtn = UIButton()
    weak var backBtn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false;
        self.navigationController?.navigationBar.hidden = true
        self.navigationController?.navigationBar.translucent = false
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.setupNav()
    }
    
    func setupNav(){
        let coustomNav = NavgationBarView()
        coustomNav.frame = CGRectMake(0, 0, APPW, NavHeight)
        self.coustomNavBar = coustomNav
        coustomNav.backgroundColor = NavBackGroundColor()
        self.view.addSubview(coustomNav)
        
        let leftBtn = UIButton()
        self.leftBtn = leftBtn;
        leftBtn.frame = CGRectMake(10, 7, 50, 50);
        leftBtn.addTarget(self, action: #selector(BaseViewController.leftBtnclick), forControlEvents: .TouchUpInside)
        self.coustomNavBar?.addSubview(leftBtn)
        
        let rightBtn = UIButton()
        self.rightBtn = rightBtn;
        rightBtn.frame = CGRectMake(APPW-40, 25, 30, 30);
        rightBtn.addTarget(self, action: #selector(BaseViewController.rightBtnclick), forControlEvents: UIControlEvents.TouchUpInside)
        self.coustomNavBar?.addSubview(rightBtn)
        
        let backBtn = UIButton()
        self.backBtn = backBtn;
        backBtn.frame = CGRectMake(0, 14, 50, 50);
        backBtn.setImage((UIImage(named: "backButton")), forState:.Normal)
        backBtn.addTarget(self, action: #selector(BaseViewController.backBtnclick), forControlEvents: .TouchUpInside)
        if (self.navigationController?.childViewControllers.count>1){
            self.coustomNavBar?.addSubview(backBtn)
        }
    }
    
    func leftBtnclick(){
    
    }
    func rightBtnclick(){
        
    }
    func backBtnclick(){
        
    }

}
