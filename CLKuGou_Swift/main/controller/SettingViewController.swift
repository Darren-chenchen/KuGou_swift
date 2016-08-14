//
//  SettingViewController.swift
//  CLKuGou_Swift
//
//  Created by Darren on 16/8/6.
//  Copyright © 2016年 darren. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    var bottomImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 最底层放一个imageView
        bottomImageView.frame = self.view.bounds
        bottomImageView.image = UIImage(named: "set_bj1.jpg")
        self.view.addSubview(bottomImageView)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }
}
