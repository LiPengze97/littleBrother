//
//  ConstVariables.swift
//  LittleBrother
//
//  Created by Eric on 07/12/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

typealias hud = SVProgressHUD

//MARK: - Keys
///bool
let kIsFirstOpen = "kIsFirstopened"
///bool
let kIsSignedIn = "kIsSignedIn"

let kIdKey = "idfasfe"
let kPhoneKey = "phondfasee"
let kNickNameKey = "nickName"
let kGenderKey = "gender"
let kAuthenStatusKey = "typoeleu"
let kSchoolKey = "fswgfewaf"
let kRealNameKey = "relanameky"
let kRealIdKey = "realidkEu"
let kToSaveKey = "fwsefw"

let kHeadImageKey = "heafasefd"
let kCurrentUserKey = "fdasfcewa"

//MARK: - const strings for this app
let nan = "男", nv = "女"
///未选择
let unKnown = "未选择"
///是否已认证
let Authen_YES = "已认证"
let Authen_NO = "未认证"
let Authen_WAIT = "认证中"
let defalutSchoolId = "53d76162601b5d6c01601b5d781f0000"
let defaultFormat = "yyyy-MM-dd HH:mm:ss"
//MARK: - const values
let userDefault = UserDefaults.standard
let ScreenWidth = UIScreen.main.bounds.width;
let ScreenHeigh = UIScreen.main.bounds.height;
let IPAD = UIDevice.current.userInterfaceIdiom == .pad
let IPHONE = UIDevice.current.userInterfaceIdiom == .phone
let numBoardSmall:CGFloat = 216
let IPHONE4 = IPHONE && ScreenHeigh < 568.0
let IPHONE5 = IPHONE && ScreenHeigh == 568.0
let IPHONE6 = IPHONE && ScreenHeigh == 667.0
let IPHONE6P = IPHONE && ScreenHeigh == 736.0 || ScreenWidth == 736.0


