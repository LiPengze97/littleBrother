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
     /* 默认 Content-Type: application/json;charset=UTF-8
     响应格式：
     {
        "code": 0,
        "codeInfo": "OK",
        "data": {}
     }
     code与codeInfo的对应关系如下：
     OK(0),                  // 请求成功
     NotRegister(100)        // 手机号未注册
     Error(200),             // 请求失败
     NotLogin(201),          // 未登录
     MaxSessions(202),       // 多地登录，先登录的会被后登录的挤下线
     ParameterError(203),    // 请求参数不正确
     UserExists(204),        // 用户已存在
     NotBelong(205),         // 指定的资源不属于当前用户
     MissionStatusError(206) // 任务状态错误
     
     任务状态
     WAIT,                   // 初始状态
     PROCESSING,             // 有人接单
     CANCEL,                 // 接单人取消接单
     FINISH,                 // 结束
     
     用户认证状态
     NOT                     // 未认证
     WAIT                    // 等待认证
     PASS                    // 通过认证
     
     未登录状态请求
     Response
     "code":201    */
    
    static let baseURLString =  "http://ischool.suqingfa.win:8080"
    
    ///注册 参数: 昵称 手机 性别 学校 邀请码""
    case signUp(String, String, String, String, String)
    ///登录 参数: 手机号 验证码
    case logIn(String, String)
    ///下线
    case logOut
    ///获取自己信息
    case getUserOwnInfo
    ///获取别人信息 参数: id
    case getOtherUserInfo(String)
    ///上传用户头像
    case setUserAvatar
    ///获取别人头像 参数: id
    case getUserAvatar(String)
    ///获取自己头像
    case getOwnAvatar
    ///添加地址 参数: 地址
    case addAddr(String)
    ///删除地址 参数: id
    case deleteAddr(String)
    ///修改地址 参数: id 地址
    case updateAddr(String, String)
    ///地址列表, 谁知道这是什么意思
    case getAddrList
    ///发布任务 参数: 标题 描述 地址 价格
    case releaseTask(String, String, String, String)
    ///结束任务 参数: id
    case endTask(String)
    ///接任务 参数: id
    case acceptTask(String)
    ///取消任务 参数: id
    case cancelTask(String)
    ///确认取消任务 参数: id, 谁知道这是什么意思
    case acceptCancel(String)
    ///我发布的任务 参数: Status, Page
    case myPostTasks(String, String)
    ///我接受的任务 参数: Status, Page
    case myAcceptTasks(String, String)
    ///附近的任务 参数: 学校ID, Page
    case nearbyTask(String, Int)
    ///意见反馈 参数: 字符串内容
    case addFeedback(String)
    ///获取邀请码
    case getInvitationCode
    ///获取验证码，参数为手机号
    case getIdentifyCode(String)
    ///获取学校列表
    case getSchools
    ///实名认证
    case authentic
 
 
    func asURLRequest() throws -> URLRequest {
        
        let result: (path: String, para: Parameters) = {
        
            var params: [String: Any] = [:]
            
            switch self {
            case .getSchools:
                return ("/api/common/school", params)
            case .getIdentifyCode(let phone):
                params = ["mobile": phone ]
                return ("/api/common/sendSms", params)
            case .signUp(let username, let mobile, let gender, let school, let invitationCode):
                params = ["username": username, "mobile": mobile, "sex": gender, "school": school]
                let p = NSMutableDictionary(dictionary: params)
                if invitationCode != "" {
                    p.setValue(invitationCode, forKey: "invitationCode") }
                params = p as! [String : Any]
                return ("/api/account/register", params)
            case .logIn(let tel, let password):
                params = ["username": tel, "password": password]
                return ("/api/account/login", params)
            case .logOut:
                return ("/api/account/logout", params)
            case .getUserOwnInfo:
                return ("/api/account/getUserInfo", params)
            case .authentic:
                return ("/api/account/auth", params)
            case .setUserAvatar:
                return ("/api/account/setUserAvatar", params)
            case .getOtherUserInfo(let id):
                params = ["id": id]
                return ("/api/account/getUserInfo", params)
            case .getInvitationCode:
                return ("/api/account/getInvitationCode", params)
            case .addAddr(let addr):
                params = ["address": addr]
                return ("/api/address/add", params)
            case .deleteAddr(let id):
                params = ["id": id]
                return ("/api/address/delete", params)
            case .updateAddr(let id, let addr):
                params = ["id": id, "address": addr]
                return ("/api/address/update", params)
            case .getAddrList:
                return ("/api/address/list", params)
            case .releaseTask(let title, let description, let address, let price):
                params = ["title": title, "description": description,
                              "address": address, "price": price]
                return ("/api/mission/add", params)
            case .endTask(let id):
                params = ["id": id]
                return ("/api/mission/finish", params)
            case .acceptTask(let id):
                params = ["id": id]
                return ("/api/mission/accept", params)
            case .cancelTask(let id):
                params = ["id": id]
                return ("/api/mission/cancel", params)
            case .acceptCancel(let id):
                params = ["id": id]
                return ("/api/mission/acceptCancel", params)
            case .myPostTasks(let status, let page):
                params = ["status": status, "page": page]
                return ("/api/mission/myList", params)
            case .myAcceptTasks(let status, let page):
                params = ["status": status, "page": page]
                return ("/api/mission/acceptList", params)
            case .nearbyTask(let schoolId, let page):
                params = ["schoolId": schoolId, "page": page]
                return ("/api/mission/nearby", params)
            case .addFeedback(let feedback):
                let params = ["feedback": feedback]
                return ("/api/feedback/add", params)
            case .getOwnAvatar:
                return ("/api/account/getUserAvatar", params)
            case .getUserAvatar(let id):
                params = ["id": id]
                return ("/api/account/getUserAvatar", params)
            }
        }()
    
        return try getMethodAndEncoding(result.path, result.para)
    }
    
    private func getMethodAndEncoding(_ path: String, _ parameter: Parameters) throws -> URLRequest {
        let url = URL(string: Router.baseURLString)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        switch self {
        case .getSchools,         .getUserOwnInfo,
             .getOtherUserInfo,   .getUserAvatar,
             .getInvitationCode,  .getAddrList,
             .myAcceptTasks,      .myPostTasks,
             .nearbyTask,         .getOwnAvatar:
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            return try URLEncoding.default.encode(urlRequest, with: parameter)
        case .logIn:
            urlRequest.httpMethod = HTTPMethod.post.rawValue
            return try URLEncoding.default.encode(urlRequest, with: parameter)
        default:
            urlRequest.httpMethod = HTTPMethod.post.rawValue
            return try JSONEncoding.default.encode(urlRequest, with: parameter)
        }
        
    }
    
    static func getAvatarURL(_ id: String) -> URL? {
        return URL(string: "http://ischool.suqingfa.win:8080/api/account/getUserAvatar?id="+id)
    }
    
}



