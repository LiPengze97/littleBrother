//
//  CodeVerifyController.swift
//  打折啦
//
//  Created by Eric on 8/4/17.
//  Copyright © 2017 INGStudio. All rights reserved.
//

import Foundation
import Alamofire

class CodeVerifyController: SignUpBaseViewController {
    
    var phone = ""
    var timer: Timer!
    var time = 60 {
        didSet{
            if time == 0 {
                labelSubtitle?.text = "重新发送"
                labelSubtitle?.textColor = Config.systemBlue
                timer.invalidate()
            }else{
                labelSubtitle?.text = "重新发送(\(time))"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMainConstraint(tf: ScreenHeigh/2 - numBoardSmall/2, nxt: 22)
        specificView()
        fire()
    }
    func fire() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @objc func didTap() {
        guard time == 0 else { return }
        labelSubtitle?.textColor = UIColor.lightGray
        time = 60
        fire()
        hud.show()
        HttpRequest.requestJSON(Router.getIdentifyCode(phone)) { _, code, _ in
            switch code {
            case 203: hud.showError(withStatus: "手机号错误")
            case 0: hud.showSuccess(withStatus: "验证码已发送")
            default: hud.showError(withStatus: "未知错误")
            }
        }
    }
    
    @objc func tick() {
        time -= 1
    }
   
    @objc override func nxt() {
        guard nxtValid else { return }
        attemptLogIn()
    }
    
    func attemptLogIn() {
        hud.show()
        var vericode = textField1?.text
        debugActions {
            self.phone = "17864154930"
            vericode = "123456"
        }
 
        HttpRequest.requestJSON(Router.logIn(phone, vericode!)) {
            response, code, data in
             
            switch code {
            case 100:
                hud.dismiss()
                let fillDetail = DetailFillController()
                fillDetail.phone = self.phone
                self.pushWithoutTabBar(fillDetail)
            case 0:
                
                _ = Person(data, toSave: true)
                //现在本地存了person，直接dismiss后拿出来用
                let completionHandler = (self.navigationController!.viewControllers[0] as! PhoneNumberController).loginDidFinishHandler
                self.navigationController?.dismiss(animated: true, completion: completionHandler)
                
            default: hud.showError(withStatus: "未知错误")
            }
            
            
           
        }
    }
    
    func specificView() {
        labelTitle = UILabel()
        textField1?.keyboardType = .numberPad
        textField1?.placeholder = ph2
        textField1?.addTitleLabel(labelTitle!)
        addSubtitle()
        labelSubtitle?.addTapGest(target: self, action: #selector(didTap))
        labelSubtitle?.font = UIFont.systemFont(ofSize: 14.5)
        
    }
    
    
    @objc override func valueChanged() {
       
        let txtLen = textField1!.text!.len()
        nxtValid = (txtLen >= 4 && txtLen <= 8)
        labelTitle?.text = txtLen == 0 ? "" : ph2
    }
    
    override func addSubtitle() {
        
        labelSubtitle = UILabel()
        labelSubtitle?.isUserInteractionEnabled = true
        labelSubtitle?.textAlignment = .right
        labelSubtitle?.textColor = UIColor.lightGray
        labelSubtitle?.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(labelSubtitle!)
        labelSubtitle?.snp.makeConstraints{ make in
            make.top.equalTo(textField1!.snp.bottom).offset(10)
            make.right.equalTo(textField1!)
            make.height.equalTo(24)
            make.width.equalTo(100)
        }
    }
    
}




