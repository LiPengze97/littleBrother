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

///订单状态
enum MissionStatus: String {
    
    case WAIT = "WAIT"
    case PROCESSING = "PROCESSING"
    case CANCEL = "CANCEL"
    case FINISH = "FINISH"
    
    func describe() -> String {
        switch self {
        case .CANCEL: return "订单取消"
        case .PROCESSING: return "进行中"
        case .WAIT: return "未接单"
        case .FINISH: return "订单完成"
        }
    }
}

enum Regex {
    static let name = "^(?!.*\\s).{1,12}$"
    static let pswd = "^(?!.*\\s).{8,16}$"
    static let email = "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$"
    static let phone = "^1[3-9]{1}[0-9]{9}$"
}


