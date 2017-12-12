//
//  Item.swift
//  打折啦
//
//  Created by Eris on 22/08/2017.
//  Copyright © 2017 INGStudio. All rights reserved.
//

import Foundation

class Mission {
    
    var id: String!
    ///发布者
    var master: Person!
    ///接单者
    var acceptUser: Person?
    
    var title: String!
    var address: String!
    var description: String!
    var price: Double!
    var time: String!
    var status: MissionStatus!
    var acceptTime: String!
    
    init() {}
    
    init(_ data: JSON) {
        analyse(data)
    }
   
    
    ///value是 最小的那个字典，id = ···，······
    func analyse(_ value: JSON) {
        
        id = value["id"].string ?? "0"
        master = Person(value["user"])
        
        title = value["title"].string ?? "加载中"
        description = value["description"].string ?? "暂无描述"
        address = value["address"].string ?? "未填写"
        price = value["price"].doubleValue
        time = "\(value["time"].int64Value)"
        status = MissionStatus(rawValue: value["status"].string ?? "WAIT")
        acceptTime = value["acceptTime"].string
        acceptUser = Person(value["acceptUser"]) 
        
    }
    
    
}









