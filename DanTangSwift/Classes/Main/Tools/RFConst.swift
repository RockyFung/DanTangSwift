//
//  RFConst.swift
//  DanTang-Swift
//
//  Created by rocky on 16/8/11.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit

/// RGBA的颜色设置
func RFColor(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

/// 背景灰色
func RFGlobalColor() -> UIColor {
    return RFColor(240, g: 240, b: 240, a: 1)
}

/// 红色
func RFGlobalRedColor() -> UIColor {
    return RFColor(245, g: 80, b: 83, a: 1.0)
}


/// 服务器地址
let BASE_URL = "http://api.dantangapp.com/"

/// code 码 200 操作成功
let RETURN_OK = 200