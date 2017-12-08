//
//  HTTRequest.swift
//  LittleBrother
//
//  Created by Eric on 07/12/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import Alamofire
class HttpRequest {
    
    ///闭包参数: 原response(一般不用), code, data
    static func requestJSON(_ url: URLRequestConvertible, _ processBlock: @escaping (_ response: DataResponse<Any>, _ code: Int, _ data: JSON) -> Void) {
    
        Alamofire.request(url).responseJSON { respon in
            switch respon.result {
            case .success(let value):
                let js = JSON(value)
                let codeRaw = js["code"].int ?? 200 //?0 -> 0, nil -> 200
                processBlock(respon, codeRaw, js["data"])
            case .failure(let error):
                hud.showError(withStatus: "无网络连接")
                log("\(error)", LogType.error)
            }
        }
    }
    
    static func uploadFile(_ url: URLRequestConvertible) {
        
    }
    
    
    
    
    
}
