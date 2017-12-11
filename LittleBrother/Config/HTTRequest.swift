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
    static func requestJSON(_ url: URLRequestConvertible, _ processBlock: @escaping (DataResponse<Any>, Int, JSON) -> Void) {
    
        Alamofire.request(url).responseJSON { respon in
            dealResponse(respon, processBlock)
        }
    }
 
    ///
    static func downloadFile(_ url: URLRequestConvertible, _ progressHandler: ((Double) -> Void)? = nil, _ responseHandler: @escaping (DownloadResponse<Data>, Data) -> Void) {
        
        Alamofire.download(url)
            
            .downloadProgress { progress in
                progressHandler?(progress.fractionCompleted)
            }
        
            .responseData { (response) in
                
                switch response.result {
                    
                case .success(let value):
                    let js = JSON(value)
                    let codeRaw = js["code"].int
                    if codeRaw == nil || codeRaw == 0 {
                        responseHandler(response, value)
                    } else {
                        log("😭😭😭")
                        print(js)
                    }
                    
                case .failure: break
                }
                
                
            }
    }
    
    static func uploadFile(_ url: URLRequestConvertible, _ dataHandler: @escaping (MultipartFormData) -> Void, _ progressHandler: @escaping (Double) -> Void, _ responseHandler: @escaping (DataResponse<Any>, Int, JSON) -> Void) {
        
        Alamofire.upload(multipartFormData: { (multi) in
            dataHandler(multi)
            
        }, with: url) { encodeResult in
            
            switch encodeResult {
                
            case .failure(let error):
                hud.showError(withStatus: "文件编码失败")
                log(error)
                
            case .success(let thisRequest, _, _): thisRequest
                
                .uploadProgress { progress in
                    progressHandler(progress.fractionCompleted)
                }
                
                .responseJSON { respon in
                    dealResponse(respon, responseHandler)
                }
                
            }
            
            
        }
 
    }
    
    private static func dealResponse(_ response: DataResponse<Any>, _ successHandler: (DataResponse<Any>, Int, JSON) -> Void) {
       
        switch response.result {
            
        case .success(let value):
            let js = JSON(value)
            let codeRaw = js["code"].int ?? 200 //?0 -> 0, nil -> 200
            successHandler(response, codeRaw, js["data"])
            
        case .failure(let error):
            hud.showError(withStatus: "无网络连接")
            log("\(error)", LogType.error)
        }
        
    }
    
}




