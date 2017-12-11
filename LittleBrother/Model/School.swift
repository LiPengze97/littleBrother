//
//  School.swift
//  LittleBrother
//
//  Created by Eric on 10/12/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation

private let kSchoolNameK = "sdadsf"
private let kSchoolIdK = "dafsdes"

class School: NSObject, NSCoding {
    
    var name: String
    var id: String
    
    init(_ id: String, _ name: String) {
        self.name = name
        self.id = id
    }
    
    init(_ data: JSON) {
        name = data["school"].string ?? "未选择"
        id = data["id"].string ?? "0"
    }
 
    ///序列化一个对象的时候使用,用于存本地
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: kSchoolNameK)
        aCoder.encode(id, forKey: kSchoolIdK)
    }
    
    ///反序列化的时候用
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: kSchoolNameK) as? String ?? "未选择"
        id = aDecoder.decodeObject(forKey: kSchoolIdK) as? String ?? "0"
    }
    
}


