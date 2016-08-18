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
    weak var selectedButton = UIButton()
    weak var indicatorView = UIView()
    weak var topView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // 添加自控制器
        self.setupChildViewVC()
        
        self.setupTitlesView()
        
        self.setupScollView()
        
        // 设置导航栏
        self.setupMainNav()
        
        CLNotificationCenter.addObserver(self, selector: #selector(getMessage), name: ChangeMainVCContentEnable, object: nil)
    }
    
    func getMessage(){
        bottomScrollView?.userInteractionEnabled = true
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
    
    /// 顶部标签栏
    func setupTitlesView() {
        // 标签
        let titlesView = UIView()
        titlesView.frame = CGRectMake(60, 20,APPW-120 ,NavHeight - 20)
        self.topView = titlesView
        //底部红色指示器
        let indicatorView = UIView()
        indicatorView.backgroundColor = UIColor.redColor()
        indicatorView.cl_height = 2.0
        indicatorView.cl_y = titlesView.cl_height - 2
        self.indicatorView = indicatorView
        titlesView.addSubview(indicatorView)
        
        //内部子标签
        let count = childViewControllers.count
        let width = titlesView.cl_width / CGFloat(count)
        let height = titlesView.cl_height
        
        let titleArr = ["听","看","唱"]
        for index in 0..<count {
            let button = UIButton()
            button.cl_height = height
            button.cl_width = width
            button.cl_x = CGFloat(index) * width
            button.tag = index
            button.titleLabel!.font = UIFont.systemFontOfSize(17)
            button.setTitle(titleArr[index], forState: .Normal)
            button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            button.addTarget(self, action: #selector(titlesClick(_:)), forControlEvents: .TouchUpInside)
            titlesView.addSubview(button)
            //默认点击了第一个按钮
            if index == 0 {
                button.enabled = false
                selectedButton = button
                //让按钮内部的Label根据文字来计算内容
                button.titleLabel?.sizeToFit()
                indicatorView.cl_width = button.titleLabel!.cl_width
                indicatorView.cl_centerX = button.cl_centerX
            }
        }
        
        self.coustomNavBar.addSubview(titlesView)
    }
    /// 标签上的按钮点击
    func titlesClick(button: UIButton) {
        selectedButton!.enabled = true
        button.enabled = false
        selectedButton = button
        // 让标签执行动画
        UIView.animateWithDuration(0.5) {
            self.indicatorView!.cl_centerX = self.selectedButton!.cl_centerX
        }
        //滚动,切换子控制器
        var offset = bottomScrollView!.contentOffset
        offset.x = CGFloat(button.tag) * bottomScrollView!.cl_width
        bottomScrollView!.setContentOffset(offset, animated: true)
    }

    func setupMainNav(){
        self.leftBtn?.frame = CGRectMake(10, 25, 30, 30);
        self.leftBtn?.setBackgroundImage(UIImage(named: "placeHoder-64"), forState: .Normal)
        self.rightBtn?.setBackgroundImage(UIImage(named: "main_search"), forState: .Normal)
        self.coustomNavBar.backgroundColor = UIColor.init(white: 1, alpha: 0)
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
        // 点击按钮
        let index = Int(scrollView.contentOffset.x/scrollView.cl_width)+1;
        let button = self.topView!.subviews[index] as! UIButton
        self.titlesClick(button)
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let alphe = scrollView.contentOffset.x / scrollView.cl_width;
        self.coustomNavBar.backgroundColor = CoustomColor(51, g: 124, b: 200, a: alphe)
    }
    
    override func leftBtnclick() {
        // 如果是已经跳转了，点击后没有反应
        if self.view.cl_x != 0 {
            return
        }
        bottomScrollView?.userInteractionEnabled = false
        let setVC = SettingViewController()
        let present = CLPresent.sharedCLPresent
        setVC.transitioningDelegate = present
        setVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        presentViewController(setVC, animated: true, completion: nil)
    }
}
