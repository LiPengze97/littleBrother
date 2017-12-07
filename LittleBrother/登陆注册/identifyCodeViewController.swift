//
//  identifyCodeViewController.swift
//  LittleBrother
//
//  Created by 李鹏泽 on 2017/12/5.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class identifyCodeViewController: UIViewController {
    @IBOutlet weak var inputField: UITextField!
    
    var phone = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        //TODO: 加输入验证
        if(self.inputField.text == ""){
            self.view.noticeError("请输入验证码")
            return
        }
        
        
        Alamofire.request(Router.logIn(phone, self.inputField.text!)).responseJSON { (response) in
            print(response.result.value!)
            guard let value = response.result.value else{
                log("response.result.value is nil", .error)
                return
            }
            let json = JSON(value)
            if(json["code"] == 0){
                let userdefault = UserDefaults.standard
//                var dic = Dictionary<String, String>.init()
                for(key,_):(String,JSON) in json["data"]{
//                    dic[key] = json["data"][key].string
                    userdefault.setValue(json["data"][key].string, forKey: key)
                }
                userdefault.setValue(1, forKey: "isLogIn")
                
//                let filepath:String = NSHomeDirectory() + "Userplist.plist"
//                NSDictionary.init(dictionary: dic).write(toFile: filepath, atomically: true)
            }else if(json["code"] == 100){
                let vc = EditPersonController()
                
            }else if(json["code"] == 200){
                self.view.noticeError("网络错误")
            }
            debugPrint("📺",json)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
