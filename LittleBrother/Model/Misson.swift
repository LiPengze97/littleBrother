//
//  Item.swift
//  打折啦
//
//  Created by Eris on 22/08/2017.
//  Copyright © 2017 INGStudio. All rights reserved.
//

import Foundation

class Mission {
    
    var id: Int!
    ///发布者
    var master: Person!
    ///接单者
    var acceptUser: Person?
    
    var title: String!
    var address: String!
    var description: String!
    var price: String!
    var time: String!
    var status: MissionStatus!
    var acceptTime: String!
    
    init() {}
    
    init(_ data: JSON) {
        analyse(data)
    }
   
    
    ///value是 最小的那个字典，id = ···，······
    func analyse(_ value: JSON) {
        
        id = value["id"].int ?? 0
        master = Person(value["user"])
        
        title = value["title"].string ?? "加载中"
        description = value["description"].string ?? "暂无描述"
        address = value["address"].string ?? "未填写"
        price = value["price"].string ?? "00.0"
        time = value["time"].string ?? "\(Date())"
        status = MissionStatus(rawValue: value["status"].string ?? "WAIT")
        acceptTime = value["acceptTime"].string
        acceptUser = Person(value["acceptUser"])
        
    }
    
    
}









