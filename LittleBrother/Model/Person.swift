//
//  Model.swift
//  Application
//
//  Created by Eric on 7/23/17.
//  Copyright © 2017 Eric. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

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

//实现NSObject和NSCoding NSObject可以不加，用@objc修饰某些方法也可以。
//NSCoding接口提供了序列化和反序列化对象的时候的编解码方法。
class Person: NSObject, NSCoding {
   
    //属性值--------
    var id: Int!
    var mobile: String!
    var userName: String!
    
    var gender: String!
    var authenStatus: Authen!
    var school: String!
    
    var realName: String?
    var realID: String?
   
    //因为自己是要存本地的，直接用另一个构造方法参数true 存本地------
    var toSave: Bool!
    
    override init() {
        toSave = false
    }

    init(_ dict: JSON, toSave: Bool = false) {
        self.toSave = toSave
        analyse(dict)
        if toSave {
            userDefault.saveCustomObj(self, key: kCurrentUserKey)
        }
    }
    
    ///构造和分析总是同时调用的
    func analyse(_ dict: JSON) {
    
        let data = dict["data"].dictionaryValue
        
        id = data["id"]?.int ?? 0
        mobile = data["mobile"]?.string ?? "0"
        gender = data["sex"]?.string ?? "男"
        userName = data["username"]?.string ?? "未知"
        realName = data["name"]?.string ?? "未认证"
        realID = data["idCard"]?.string ?? "未认证"
        authenStatus = Authen(rawValue: (data["authStatus"]?.string ?? "NO"))
        school = data["school"]?.string ?? "未知"
    }
    
 
    
    ///序列化一个对象的时候使用
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: kIdKey)
        aCoder.encode(mobile, forKey: kPhoneKey)
        aCoder.encode(userName, forKey: kNickNameKey)
        aCoder.encode(gender, forKey: kGenderKey)
        aCoder.encode(authenStatus.rawValue, forKey: kAuthenStatusKey)
        aCoder.encode(realID, forKey: kRealIdKey)
        aCoder.encode(realName, forKey: kRealNameKey)
        aCoder.encode(school, forKey: kSchoolKey)
        
        aCoder.encode(toSave, forKey: kToSaveKey)
    }
    
    ///反序列化的时候用
    required init?(coder aDecoder: NSCoder) {
        toSave = aDecoder.decodeObject(forKey: kToSaveKey) as? Bool
        
        id = aDecoder.decodeObject(forKey: kIdKey) as? Int
        mobile = aDecoder.decodeObject(forKey: kPhoneKey) as? String
        userName = aDecoder.decodeObject(forKey: kNickNameKey) as? String
        gender = aDecoder.decodeObject(forKey: kGenderKey) as? String
        realID = aDecoder.decodeObject(forKey: kRealIdKey) as? String
        realName = aDecoder.decodeObject(forKey: kRealNameKey) as? String
        school = aDecoder.decodeObject(forKey: kSchoolKey) as? String
        authenStatus = Authen(rawValue: aDecoder.decodeObject(forKey: kAuthenStatusKey) as! String)
    }
    
}













