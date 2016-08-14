//
//  TabBarViewController.swift
//  CLKuGou_Swift
//
//  Created by Darren on 16/8/6.
//  Copyright © 2016年 darren. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 添加主要的控制器
        self.addChildViewController(UINavigationController.init(rootViewController: MainViewController()))
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tabBar.addSubview(self.tabBarView)
    }
    
    // 懒加载底部的播放控件
    private lazy var tabBarView: TabBarView = {
        let tabBarView = TabBarView.show()
        tabBarView.frame = CGRectMake(0,0, APPW,TabBarHeight)
        return tabBarView
    }()

}
