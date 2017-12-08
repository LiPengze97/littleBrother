//
//  PhoneVerifyController.swift
//  打折啦
//
//  Created by Eric on 8/4/17.
//  Copyright © 2017 INGStudio. All rights reserved.
//

import Foundation
import Alamofire
import YBAttributeTextTapAction

class PhoneNumberController: SignUpBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMainConstraint()
        specificView()
        setupAttributeLabel()
        addSubtitle()
    }
    
    @objc override func back() {
        navigationController?.dismiss(animated: true)
    }
    
    @objc override func valueChanged() {
        let txtLen = textField1?.text!.len()
        nxtValid = (txtLen == 11)
        labelTitle?.text = txtLen == 0 ? "" : ph1
        labelSubtitle?.text = ""
    }
    
    @objc override func nxt() {
        let txt = textField1!.text!
        guard textField1?.text?.len() == 11 && nxtValid else {
            labelSubtitle?.text = ph00; return
        }
        guard Config.predicate(Regex.phone, txt) else {
            labelSubtitle?.text = "请输入正确的手机号"; return
        }
        sendCode(of: txt)
    }
    
    func sendCode(of phone: String, to controller: CodeVerifyController = CodeVerifyController()) {
        hud.show()
        HttpRequest.requestJSON(Router.getIdentifyCode(phone)) { _, code, data in
            switch code {
            case 203: hud.showError(withStatus: "手机号错误")
            case 0:
                hud.showSuccess(withStatus: "验证码已发送")
                controller.phone = phone
                self.pushWithoutTabBar(controller)
            default:
                hud.showError(withStatus: "未知错误")
                debugActions {
                    controller.phone = phone
                    self.pushWithoutTabBar(controller)
                }
            }
        }
 
    }
   
    @objc func showTips() {

        let alertControl = UIAlertController(title: "提示", message: "该手机号已注册，是否立即登录？", preferredStyle: .alert)
        let phoneLog = UIAlertAction(title: "确定", style: .default, handler: { (alert) in
            self.navigationController?.popViewController(animated: true)
        })
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertControl.addAction(phoneLog)
        alertControl.addAction(cancel)
        present(alertControl, animated: true, completion: nil)
    }

}
