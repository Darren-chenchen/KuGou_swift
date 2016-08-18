//
//  LinsenHeadView.swift
//  CLKuGou_Swift
//
//  Created by Darren on 16/8/16.
//  Copyright © 2016年 darren. All rights reserved.
//

import UIKit
import MediaPlayer

class LinsenHeadView: UIView {

    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 最底层
        imageView.frame = CGRectMake(0, 0, APPW, 170)
        self.imageView.userInteractionEnabled = true;
        self.addSubview(imageView)
        
        //最上面
        self.setupTopButtoms();

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTopButtoms(){
        let btnW:CGFloat = 60.0;
        let btnH:CGFloat = 60.0;
        let magin:CGFloat = (APPW-CGFloat(4.0*btnW))/5.0
        let titleArr = ["我喜欢","歌单","下载","最近"];
        for i in 0..<titleArr.count {
            let btnX = magin + (magin + btnW)*CGFloat(i);
            let btn = coustomBtn()
            btn.frame = CGRectMake(btnX, 30, btnW, btnH)
            btn.titleLabel!.font = UIFont.systemFontOfSize(15)
            btn.setImage(UIImage(named: "main_clock"), forState: .Normal)
            btn.setTitle(titleArr[i], forState: .Normal)
            self.addSubview(btn)
        }
        
        let lineView = UIView()
        lineView.frame = CGRectMake(10, btnH + 30 + 30, APPW-20, 0.5)
        lineView.backgroundColor = UIColor.whiteColor();
        lineView.alpha = 0.3;
        self.addSubview(lineView)
        
        let phoneimage = UIImageView()
        phoneimage.frame = CGRectMake(20, CGRectGetMaxY(lineView.frame)+15, 20, 20)
        phoneimage.image = UIImage(named: "main_phone")
        self.addSubview(phoneimage)
        
        let lable = UILabel()
        lable.frame = CGRectMake(CGRectGetMaxX(phoneimage.frame)+8, phoneimage.cl_y, 100, 25)
        lable.text = "本地音乐";
        lable.font = UIFont.systemFontOfSize(14)
        lable.textColor = UIColor.whiteColor()
        self.addSubview(lable)
        
        let everyMusic = MPMediaQuery()
        let musicArr = everyMusic.items
        let lable2 = UILabel()
        lable2.frame = CGRectMake(APPW-130, phoneimage.cl_y, 100, 25)
        let musicCount = musicArr?.count
        if let count = musicCount {
            lable2.text = "\(count)首"
        }
        lable2.font = UIFont.systemFontOfSize(12)
        lable2.textColor = UIColor.whiteColor()
        lable2.textAlignment = NSTextAlignment.Right
        self.addSubview(lable2)
        lable2.userInteractionEnabled = true;
        
        let lable3 = UILabel()
        lable3.frame = CGRectMake(0, lable2.cl_y, APPW, lable2.cl_height)
        self.addSubview(lable3)
        lable3.userInteractionEnabled = true
        lable3.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(clickLable2)))
        
        let imageArrow = UIImageView()
        imageArrow.frame = CGRectMake(CGRectGetMaxX(lable2.frame), lable2.cl_y, 25, 25)
        imageArrow.image = UIImage(named: "arrow")
        self.addSubview(imageArrow)
        
        // 底部
        self.setupBottonButtons()
    }
    
    func clickLable2(){
    
    }
    func setupBottonButtons(){
        let bView = UIView()
        bView.frame = CGRectMake(0, CGRectGetMaxY(self.imageView.frame), APPW, 130)
        bView.backgroundColor = UIColor.whiteColor()
        self.addSubview(bView)
        
        let btnW:CGFloat = 80;
        let btnH:CGFloat = 100;
        let magin = (APPW-3*btnW)/4.0;
        let titleArr = ["乐库","电台","库群"];
        for i in 0..<titleArr.count {
            let btnX = magin + (magin + btnW)*CGFloat(i)
            let btn = coustomBtn()
            btn.frame = CGRectMake(btnX, 15, btnW, btnH)
            btn.titleLabel!.font = UIFont.systemFontOfSize(15)
            let index = i+1
            btn.setImage(UIImage(named: "n\(index)"), forState: .Normal)
            btn.setTitle(titleArr[i], forState: .Normal)
            btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
            bView.addSubview(btn)
        }

    }

}
