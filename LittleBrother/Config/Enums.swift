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
    
    static let themeColor = UIColor(red: 255/255, green: 226/255, blue: 33/255, alpha: 1)
    static let themeFontColor = UIColor.brown
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



