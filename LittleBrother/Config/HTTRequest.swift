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
    
    static func request(_ url: URLRequestConvertible, _ successBlock: @escaping (JSON?) -> Void) {
    
        Alamofire.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                successBlock(value as? JSON)
            case .failure(let error):
                log("\(error)", LogType.error)
            }
        }
    }
}
