//
//  MainViewController.swift
//  CLKuGou_Swift
//
//  Created by Darren on 16/8/6.
//  Copyright © 2016年 darren. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController,UIScrollViewDelegate {

    weak var bottomScrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置导航栏
        self.setupMainNav()
        // 添加自控制器
        self.setupChildViewVC()
        
        self.setupScollView()
    }
    
    // MARK: - 添加子控制器
    func setupChildViewVC(){
        /// 听
        self.addChildViewController(LinsenViewController())
        // 看
        self.addChildViewController(LookViewController())
        // 唱
        self.addChildViewController(SingViewController())
    }
    
    func setupMainNav(){
        self.leftBtn?.frame = CGRectMake(10, 25, 30, 30);
        self.leftBtn?.setBackgroundImage(UIImage(named: "placeHoder-64"), forState: .Normal)
        self.rightBtn?.setBackgroundImage(UIImage(named: "main_search"), forState: .Normal)
    }
    
    func setupScollView(){
        // 不要自动调整inset
        self.automaticallyAdjustsScrollViewInsets = false;
        
        let scrollView = UIScrollView()
        scrollView.frame = self.view.bounds;
        scrollView.delegate = self;
        scrollView.bounces = false;
        scrollView.pagingEnabled = true;
        self.view.insertSubview(scrollView, atIndex: 0)
        scrollView.contentSize = CGSizeMake(CGFloat(scrollView.cl_width) * CGFloat(self.childViewControllers.count), 0);
        self.bottomScrollView = scrollView;
        
        // 添加第一个控制器的view
        self.scrollViewDidEndScrollingAnimation(scrollView)
    }
    
    //MARK: - UIScrollViewDelegate
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        // 当前的索引
        let index = Int(scrollView.contentOffset.x/scrollView.cl_width)
        // 取出子控制器
        let vc = childViewControllers[index]
        vc.view.cl_x = scrollView.contentOffset.x;
        vc.view.cl_y = 0; // 设置控制器view的y值为0(默认是20)
        vc.view.cl_height = scrollView.cl_height; // 设置控制器view的height值为整个屏幕的高度(默认是比屏幕高度少个20)
        scrollView.addSubview(vc.view)
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.scrollViewDidEndScrollingAnimation(scrollView)
//        // 点击按钮
//        NSInteger index = scrollView.contentOffset.x / scrollView.width;
//        [self titleClick:index];
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let alphe = scrollView.contentOffset.x / scrollView.cl_width;
        
        self.coustomNavBar?.backgroundColor = CoustomColor(51, g: 124, b: 200, a: alphe)
    }
    
    override func leftBtnclick() {
        let setVC = SettingViewController()
        let present = CLPresent.sharedCLPresent
        setVC.transitioningDelegate = present
        setVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        presentViewController(setVC, animated: true, completion: nil)
    }
}
