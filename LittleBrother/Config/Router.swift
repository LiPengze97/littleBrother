//
//  Router.swift
//  LittleBrother
//
//  Created by Eric on 14/11/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//
import Foundation
import UIKit
import Alamofire

enum Router: URLRequestConvertible {
    
    static let baseURLString =  "http://suqingfa.win:8080"
    
    // MARK: - 用户模块
    
    //用户名是否存在
    case exists(String)
    //注册
    case signUp(String, String, String, String, String, String, String, String)
    //登录
    case logIn(String, String)
    //获取用户信息
    case getUserOwnInfo()//本人的
    case getOtherUserInfo(String)//他人的
    //设置用户信息
    case setUserInfo(String,String)
    //上传用户头像
    case setUserAvatar()
    //获取用户头像
    case getUserAvatar(String)
    //添加地址
    case addAddr(String)
    //删除地址
    case deleteAddr(String)
    //修改地址
    case updateAddr(String,String)
    //地址列表
    case getAddrList()
    //发布任务
    case releaseTask(String,String,String,String)
    //结束任务
    case endTask(String)
    //接任务
    case acceptTask(String)
    //取消任务
    case cancelTask(String)
    //我的任务
    case myTaskList(String,String)
    //附近的任务
    case nerbyTask(String)
    //意见反馈
    case addFeedback(String)
    
    //获取验证码
    case getInvitationCode()

    
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .exists:
            return .get
        case .signUp:
            return .post
        case .logIn:
            return .post
        case .getUserOwnInfo:
            return .get
        case .getOtherUserInfo:
            return .get
        case .setUserInfo:
            return .post
        case .setUserAvatar:
            return .post
        case .getUserAvatar:
            return .get
        case .getInvitationCode:
            return .get
        case .addAddr:
            return .post
        case .deleteAddr:
            return .post
        case .updateAddr:
            return .post
        case .getAddrList:
            return .get
        case .releaseTask:
            return .post
        case .endTask:
            return .post
        case .acceptTask:
            return .post
        case .cancelTask:
            return .post
        case .myTaskList:
            return .get
        case .nerbyTask:
            return .get
        case .addFeedback:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .exists:
            return "/common/exists"
        case .signUp:
            return "/api/account/register"
        case .logIn:
            return "/common/login"
        case .getUserOwnInfo:
            return "/api/account/getUserInfo"
        case .getOtherUserInfo:
            return "/api/account/getUserInfo/"
        case .setUserInfo:
            return "/user/userInfo"
        case .getUserAvatar:
            return "/api/account/getUserAvatar/"
        case .setUserAvatar:
            return "/api/account/setUserAvatar"
        case .getInvitationCode:
            return "/api/account/getInvitationCode"
        case .addAddr:
            return "api/address/add"
        case .deleteAddr:
            return "api/address/delete"
        case .updateAddr:
            return "api/address/update"
        case .getAddrList:
            return "api/address/list"
        case .releaseTask:
            return "api/mission/add"
        case .endTask:
            return "api/mission/finish"
        case .acceptTask:
            return "api/mission/accept"
        case .cancelTask:
            return "api/mission/cancel"
        case .myTaskList:
            return "api/mission/myList"
        case .nerbyTask:
            return "api/mission/nearby"
        case .addFeedback:
            return "api/feedback/add"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: Router.baseURLString)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .exists(let tel):
            let params = ["id": tel]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .signUp(let username, let password, let mobile,
                     let idCard, let name, let sex, let school, let invitationCode):
            let params = ["username": username, "password": password,
                          "mobile":mobile, "idCard":idCard, "name":name, "sex":sex,
                          "school":school, "invitationCode":invitationCode]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .logIn(let tel, let password):
            let params = ["id": tel, "password": password]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .getUserOwnInfo():
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: nil)
        case .getOtherUserInfo(let id):
                let params = ["id": id]
                return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .setUserInfo(let username, let location):
            let params = ["username": username, "location": location]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .setUserAvatar():
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: nil)
        case .getInvitationCode():
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: nil)
        case .addAddr(let addr):
            let params = ["address": addr]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .deleteAddr(let id):
            let params = ["id": id]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .updateAddr(let id, let addr):
            let params = ["id": id,"address": addr]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .getAddrList():
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: nil)
        case .releaseTask(let title, let description, let address, let price):
            let params = ["title":title,"description":description,
            "address":address,"price":price]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .endTask(let id):
            let params = ["id": id]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .acceptTask(let id):
            let params = ["id": id]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .cancelTask(let id):
            let params = ["id": id]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .myTaskList(let status, let page):
            let params = ["status": status, "page":page]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .nerbyTask(let page):
            let params = ["page": page]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .addFeedback(let feedback):
            let params = ["feedback": feedback]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .getUserAvatar(let id):
            let params = ["id":id]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        }
    }
}
