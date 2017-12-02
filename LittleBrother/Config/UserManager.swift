//
//  UserManager.swift
//  LittleBrother
//
//  Created by 李鹏泽 on 2017/12/1.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import Foundation
/*
 注册
 /api/account/register
 Request
 {
 "username":,    // 用户名/昵称
 "password":,    // 密码
 "mobile":,      // 手机号
 "idCard":,      // 身份证号
 "name":,        // 姓名
 "sex":,         // 性别 男|女
 "school":,      // 所在学校
 "invitationCode":   // 邀请码 可为空
 }
 */
public class UserManager {
    public static let shared: UserManager = UserManager()
    
    fileprivate let userDefaults = UserDefaults.standard
    
    // MARK: - 用户相关
    
    var isLogIn = false
    var canRegister = false
    
    public enum Notification : String {
        case didGetMessage
        case didGetMessageFailure
        case didexists
        case didexistsFailure
        case didSignup
        case didSignupFailure
        case didLogin
        case didLoginFailure
        case didLogout
    }
    
    private enum Action {
        //获取验证码
        case getMessage
        case exists
        case signUp
        case logIn
        //获取商品
        case tour
        case getTourism
    }
    
    var username = ""
    var password = ""
    var mobile = ""
    var idCard = ""
    var name = ""
    var sex = ""
    var invitationCode = ""
    init(){}
    init(username:String,password:String,mobile:String,
         idCard:String,name:String,sex:String,invitationCode:String ) {
        self.username = username
        self.password = password
        self.mobile = mobile
        self.idCard = idCard
        self.name = name
        self.sex = sex
        self.invitationCode = invitationCode
    }
}
