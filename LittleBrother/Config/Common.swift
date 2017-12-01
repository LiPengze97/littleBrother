//
//  Common.swift
//  LittleBrother
//
//  Created by Eric on 14/11/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit

let ScreenWidth = UIScreen.main.bounds.width;
let ScreenHeigh = UIScreen.main.bounds.height;

func Rect(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: w, height: h)
}
func Color(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, alpha: CGFloat = 1 ) -> UIColor {
    return UIColor(red: red, green: green, blue: blue, alpha: alpha)
}


enum Config {
    
    static let themeColor = UIColor(red: 255/255, green: 226/255, blue: 33/255, alpha: 1)
    static let themeFontColor = UIColor.brown
    //static let themeFont =
}

enum Identifier {
    static let personCellId = "fdajswdlr"
    static let settingCellId = "fcservswerwaefq"
    static let carryOnCellId = "dawefawew"
    static let finishedCellId = "dqwefqwfq"
}



///是否已认证
enum Authen: String {
    case YES = "已认证"
    case NO = "未认证"
}












//Aspect Fill：保持长宽比 使图片[充满容器]
//Aspect Fit：保持长宽比 使图片在容器内[完整显示]出来 [不一定充满容器]
//Scale to Fill: 拉伸变形图片至[充满容器]
