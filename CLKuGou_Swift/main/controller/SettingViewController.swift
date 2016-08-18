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
    lazy var bottomView = UIView()
    lazy var tableView = UITableView()

    var topView = UIView()
    var bottomView2 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        
        self.setupLeftGesture()
        // 给mainVC增加点击手势
        self.setupMainVCTapGesture()
    }

    func setupUI(){
        // 最底层放一个imageView
        bottomImageView.frame = self.view.bounds
        bottomImageView.image = UIImage(named: "set_bj1.jpg")
        bottomImageView.userInteractionEnabled = true
        self.view.addSubview(bottomImageView)
        
        bottomView.frame = CGRectMake(0, 0, APPW, APPH)
        self.view.addSubview(bottomView)
        bottomView.addSubview(self.setupTopView())
        bottomView.addSubview(self.setupBottomView())
        
        tableView.frame = CGRectMake(0, self.topView.cl_height+10, APPW, APPH-220)
        tableView.delegate = self;
        tableView.dataSource = self;
        bottomView.addSubview(tableView)
    }
    // MARK:- 设置顶部的view
    func setupTopView() -> UIView {
        
        topView = UIView()
        topView.frame = CGRectMake(0, 0, APPW, 100)
        
        let btn1 = UIButton()
        btn1.frame = CGRectMake(20, 30, 60, 60)
        btn1.setBackgroundImage(UIImage(named: "placeHoder-128"), forState: UIControlState.Normal)
        CLViewsBorder(btn1, borderWidth: 1, borderColor: UIColor.grayColor(), cornerRadius: btn1.cl_width*0.5)
        topView.addSubview(btn1)
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor.whiteColor()
        lineView.frame = CGRectMake(10, 105, APPW-70, 0.5)
        lineView.alpha = 0.3
        topView.addSubview(lineView)
        return topView
    }
    // MARK:- 设置低部的view
    func setupBottomView() -> UIView {
        bottomView2 = UIView()
        bottomView2.frame = CGRectMake(0, APPH-111, APPW, 110)
        
        let btn2 = UIButton()
        btn2.frame = CGRectMake(20, 30, 60, 60)
        btn2.setBackgroundImage(UIImage(named: "placeHoder-128"), forState: UIControlState.Normal)
        CLViewsBorder(btn2, borderWidth: 1, borderColor: UIColor.grayColor(), cornerRadius: btn2.cl_width*0.5)
        bottomView2.addSubview(btn2)
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor.whiteColor()
        lineView.frame = CGRectMake(10, 1, APPW-70, 0.5)
        lineView.alpha = 0.3
        bottomView2.addSubview(lineView)
        return bottomView2
    }
    
    func setupLeftGesture(){
        let panGesture = UIPanGestureRecognizer()
        panGesture.addTarget(self, action: #selector(clickPan(_:)))
        self.view.addGestureRecognizer(panGesture)
    }
    
    func clickPan(pan:UIPanGestureRecognizer){
        let point = pan.translationInView(self.view)
        if (point.x>0) {
            return
        }
        let deltaX = fabs(point.x)
        let scare = 1-deltaX/1000.0
        
        let tranX = -fabs(deltaX)/200.0
        let tranY = fabs(deltaX)/1000.0

//        print("%f",scare)

        if scare<0.5 {
            self.bottomView.transform = CGAffineTransformMakeScale(0.5,0.5)
        } else {
            self.bottomView.transform = CGAffineTransformScale(self.view.transform, scare, scare)
            
            if (((APPW-50)/APPW + tranX)>=0) {
                self.presentingViewController!.view.cl_x =  ((APPW-50)/APPW + tranX)*APPW
                self.presentingViewController!.view.cl_y =  (100/APPH-tranY)*APPH
                self.presentingViewController!.view.cl_height = APPH-2*self.presentingViewController!.view.cl_y
            }
            
            if (pan.state == UIGestureRecognizerState.Ended) {
                if (((APPW-50)/APPW + tranX)<=0.2) {
                    UIView.animateWithDuration(0.1, animations: { 
                        self.presentingViewController!.view.cl_x = 0
                        self.presentingViewController!.view.cl_y = 0
                        self.presentingViewController!.view.cl_height = APPH
                        self.bottomView.transform = CGAffineTransformMakeScale(1,1)
                        }, completion: { (true) in
                            self.dismissViewControllerAnimated(true, completion: nil)
                    })
                    CLNotificationCenter.postNotificationName(ChangeMainVCContentEnable,object: self, userInfo: nil)

                    } else {
                    UIView.animateWithDuration(0.3, animations: { 
                        self.presentingViewController!.view.cl_x = APPW-50
                        self.presentingViewController!.view.cl_y = 100
                        self.presentingViewController!.view.cl_height = APPH-200
                        self.bottomView.transform = CGAffineTransformMakeScale(1,1)

                    })
                }
            }
        }

    }
    
    func setupMainVCTapGesture(){
        let panGestureMain = UIPanGestureRecognizer()
        panGestureMain.addTarget(self, action: #selector(clickMainVC))
        self.presentingViewController?.view.addGestureRecognizer(panGestureMain)
    }
    
    func clickMainVC(){
        self.dismissViewControllerAnimated(true) {
            CLNotificationCenter.postNotificationName(ChangeMainVCContentEnable,object: self, userInfo: nil)
        }
    }
}

extension SettingViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let ID = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: ID)
        }
        cell?.backgroundColor = CoustomColor(0, g: 22, b: 99, a: 1)
        cell?.textLabel?.textColor = UIColor.whiteColor()
        cell?.textLabel?.text = "手机专享"
        return cell!
    }
}

