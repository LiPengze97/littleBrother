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

func myRange(_ location: Int, _ length: Int) -> NSRange {
    return NSRange(location: location, length: length)
}

///返回一段文字的自适应 CGSize
/// - Parameters:
///   - txt: 内容
///   - size: 字号
///   - maxSize: 所能容忍的最大尺寸 默认 200, 25
///   - lineSpace: 其实这个行距参数该直接换成 NSMutableParaStyle，便于拓展。不过现在先算了
func autoSize(_ txt: String, size fontSize: CGFloat, maxSize: CGSize = CGSize(width: 200, height: 25), lineSpace: CGFloat = 0) -> CGSize {
    let para = NSMutableParagraphStyle()
    para.lineBreakMode = .byWordWrapping
    if lineSpace != 0 {
        para.lineSpacing = lineSpace
    }
    let attri = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize),
                 NSAttributedStringKey.paragraphStyle: para.copy()]
    var siz = NSString(string: txt)
        .boundingRect(with: maxSize,
                      options: [.usesLineFragmentOrigin,.usesFontLeading, .truncatesLastVisibleLine],
                      attributes: attri, context: nil).size
    siz.height = ceil(siz.height)
    siz.width = ceil(siz.width)+2
    return siz
}

///获取带有行距的AttributedString
/// - Parameters:
///   - str: 内容
///   - lineSpca: 间距
func getAttributed(_ str: String, lineSpac: CGFloat) -> NSAttributedString {
    let atStr = NSMutableAttributedString(string: str)
    let parStyle = NSMutableParagraphStyle()
    parStyle.lineSpacing = lineSpac
    let ra = myRange(0, str.len())
    atStr.addAttribute(NSAttributedStringKey.paragraphStyle, value: parStyle, range: ra)
    return atStr
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
    static let distributeCellId = "dasefaqfaew"

}



///是否已认证
enum Authen: String {
    case YES = "已认证"
    case NO = "未认证"
}












//Aspect Fill：保持长宽比 使图片[充满容器]
//Aspect Fit：保持长宽比 使图片在容器内[完整显示]出来 [不一定充满容器]
//Scale to Fill: 拉伸变形图片至[充满容器]
