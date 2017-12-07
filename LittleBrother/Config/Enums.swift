//
//  Enum.swift
//  LittleBrother
//
//  Created by Eric on 07/12/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit

enum Config {
    
    static let themeColor = Color(255, 226, 33)
    static let themeFontColor = UIColor.brown
    static let systemBlue = Color(0, 111, 255)
    
    static func predicate(_ type: String, _ content: String) -> Bool {
        let predicator = NSPredicate(format: "SELF MATCHES %@", type)
        return predicator.evaluate(with: content)
    }
    //static let themeFont =
}

enum LogType: String {
    case ln = "✏️"
    case error = "❗️"
    case date = "🕒"
    case url = "🌏"
    case json = "💡"
    case fuck = "🖕"
    case happy = "😄"
}

enum Identifier {
    static let personCellId = "fdajswdlr"
    static let systemStyleCellId = "fcservswerwaefq"
    static let carryOnCellId = "dawefawew"
    static let finishedCellId = "dqwefqwfq"
    static let distributeCellId = "dasefaqfaew"
    static let mainTableCellId = "dafesaeffcasea"
    static let tableheaderViewId = "dfasefwserw"
}

///是否已认证
enum Authen: String {
    case YES = "已认证"
    case NO = "未认证"
    case WAIT = "认证中"
}

///订单状态
enum MissionStatus: String {
    case WAIT = "未接单"
    case PROCESSING = "进行中"
    case CANCEL = "订单取消"
    case FINISH = "订单完成"
}

enum Regex {
    static let name = "^(?!.*\\s).{1,12}$"
    static let pswd = "^(?!.*\\s).{8,16}$"
    static let email = "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$"
    static let phone = "^1[3-9]{1}[0-9]{9}$"
}


