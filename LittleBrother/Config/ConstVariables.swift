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

let kIsFirstOpen = "kIsFirstopened"
let kIsSignedIn = "kIsSignedIn"
let kCurrentUserKey = "fdasfcewa"

let kIdKey = "idfasfe"
let kPhoneKey = "phondfasee"
let kNickNameKey = "nickName"
let kGenderKey = "gender"
let kAuthenStatusKey = "typoeleu"
let kSchoolKey = "fswgfewaf"
let kRealNameKey = "relanameky"
let kRealIdKey = "realidkEu"

let kHeadImageKey = "heafasefd"
let kToSaveKey = "fwsefw"

let userDefault = UserDefaults.standard
let ScreenWidth = UIScreen.main.bounds.width;
let ScreenHeigh = UIScreen.main.bounds.height;
let UI_IPAD = UIDevice.current.userInterfaceIdiom == .pad
let IPHONE = UIDevice.current.userInterfaceIdiom == .phone
let numBoardSmall:CGFloat = 216

typealias hud = SVProgressHUD

let IPHONE4 = IPHONE && ScreenHeigh < 568.0
let IPHONE5 = IPHONE && ScreenHeigh == 568.0
let IPHONE6 = IPHONE && ScreenHeigh == 667.0
let IPHONE6P = IPHONE && ScreenHeigh == 736.0 || ScreenWidth == 736.0


