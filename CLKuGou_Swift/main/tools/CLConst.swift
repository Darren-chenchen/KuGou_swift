//
//  CLConst.swift
//  CLKuGou_Swift
//
//  Created by Darren on 16/8/6.
//  Copyright © 2016年 darren. All rights reserved.
//

import UIKit

/// 屏幕的宽
let APPW = UIScreen.mainScreen().bounds.size.width
/// 屏幕的高
let APPH = UIScreen.mainScreen().bounds.size.height

 /// tabbar高度
let TabBarHeight:CGFloat = 60

// MARK:-配置导航栏
let NavHeight:CGFloat = 64
func NavTitleColor() -> UIColor{
    return UIColor.whiteColor()
}
func NavBackGroundColor() -> UIColor{
    return CoustomColor(51, g: 124, b: 200, a: 1)
}
let NavTitleFont = UIFont.systemFontOfSize(17)

// MARK:-配置颜色
func CoustomColor(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}
func APPTextColor() -> UIColor{
    return CoustomColor(50, g: 50, b: 50, a: 1)
}

