//
//  SigninViewController.swift
//  Application
//
//  Created by Eric on 7/20/17.
//  Copyright © 2017 Eric. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Alamofire

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    var headImgView: UIImageView!
    var accountField: UITextField!
    var forgetButton: UIButton!
    var loginButton: UIButton!
    var psdField: UITextField!
    var newButton: UIButton!
    var mark1:UIView!
    var cancelButton: UIButton!
    var bottomLabel: UILabel!
    
    ///整体
    var headConstr:Constraint?
    ///头像下方
    var txtfConstr:Constraint?
    ///登陆按钮上方
    var signConstr:Constraint?
    
    let standard: CGFloat = v(0.4, 0.35, 0.35)
    let distance: CGFloat = 50
    let height2: CGFloat = 39
    let top: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @objc func cancel() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing()
    }

    func myDismiss() {
        let abc = navigationController?.presentingViewController as? ViewController
        navigationController?.dismiss(animated: true) {
            guard abc != nil else { return }
            //let toselect = abc!.toSelectIndex
            //abc?.selectedViewController = abc!.viewControllers?[toselect]
           
            abc?.selectedIndex = 4
            hud.show()           
        }
    }
    
    @objc func login(_ button: UIButton) {
        
        //pushWithoutTabBar(CodeVerifyController())
        #if DEBUG
//            let me = Person()
//            me.toSave = true
//            me.id = 10
//            me.phone = "13176370907"
//            me.userName = "Catherine1323224"
//            me.gender = "男"
//            me.realName = ""
//            me.realID = ""
//            userDefau.saveBasic(true, key: isSignedKey)
//            me.analyse([:])
        #endif
        
        endEditing()
        let account = accountField.text
        let passd = psdField.text
        let psdLen = passd!.len()
        hud.setMinimumDismissTimeInterval(0.5)
        if account == "" {
            hud.showError(withStatus: "请输入账号"); return
        }
        if account!.contains(" ") || account!.len() >= 30 {
            hud.showError(withStatus: "账号输入错误"); return
        }
        if passd == "" {
            hud.showError(withStatus: "请输入密码"); return
        }
        if passd!.contains(" ") || psdLen < 8 || psdLen > 16 {
            hud.showError(withStatus: "密码错误"); return
        }
        hud.show(withStatus: "正在登录")
        start(account!, passd!)
        
    }
    func start(_ account: String, _ pswd: String) {
//        HttpRequest.request(Router.logIn(account, pswd)) { value in
//            switch value?["code"].int {
//            case 0:
//                case
//            }
//        }
    }
   
    func success(_ value: Any) {
//        let info = JSON(value)
//        let person = Person(info, toSave: true)
//
//        userDefault.saveBasic(true, key: kIsSignedIn)
//        hud.showSuccess(withStatus: "登陆成功")
//
        //myDismiss()
    }
    
    @objc func phoneSign() {
        navigationController?.pushViewController(PhoneSignInController(), animated: true)
    }
    @objc func find() {
        navigationController?.pushViewController(ResetPsdController(), animated: true)
    }
    @objc func new(_ button: UIButton) {
         pushWithoutTabBar(PhoneNumberController())
    }
    @objc func forget(_ button: UIButton) {
        let alertControl = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let find = UIAlertAction(title: "找回密码", style: .default, handler: { (alert) in self.find() })
        let phoneLog = UIAlertAction(title: "短信验证登陆", style: .default, handler: { (alert) in self.phoneSign() })
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertControl.addAction(phoneLog)
        alertControl.addAction(find)
        alertControl.addAction(cancel)
        present(alertControl, animated: true, completion: nil)
    }

    ///change top constraint animatedly
    ///Param isBack: 1 indicating normal or 2 inputing
    func change(by times: CGFloat, duration seconds: Double) {
 
        UIView.animate(withDuration: seconds, animations: {
            self.headConstr?.update(offset: ScreenHeigh*self.standard*0.5/times.squareRoot().squareRoot())
            self.txtfConstr?.update(offset: ScreenHeigh*self.standard/times.squareRoot())
            self.signConstr?.update(offset: self.height2/times)
            self.view.layoutIfNeeded()
        })
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        endEditing()
    }
    
    func endEditing() {
        view.endEditing(true)
        change(by: 1, duration: 0.2)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        change(by: 1.8, duration: 0.3)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 200:
            psdField.becomeFirstResponder()
        case 201:
            login(loginButton)
        default:
            break
        }
        return true
    }
    
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        if textField == accountField {
            psdField.text = ""
        }
        return true
    }
}


class PhoneSignInController: PhoneNumberController {
    
    @objc override func nxt() {
        let txt = textField1!.text!
        guard textField1?.text?.len() == 11 && nxtValid else {
            labelSubtitle?.text = ph00
            return
        }
        guard Config.predicate(Regex.phone, txt) else {
            labelSubtitle?.text = "请输入正确的手机号"
            return
        }
    
    }

    @objc override func showTips() {
        //let ph = textField1!.text!
        let alertControl = UIAlertController(title: "提示", message: "该手机号尚未注册，是否立即注册？", preferredStyle: .alert)
        let phoneLog = UIAlertAction(title: "确定", style: .default, handler: { (alert) in
            
        })
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertControl.addAction(phoneLog)
        alertControl.addAction(cancel)
        present(alertControl, animated: true, completion: nil)
    }
    
}


class CodeSignInController: CodeVerifyController {
    
    override func nxt() {
        guard nxtValid else { return }

        
    }
//    func success(value: Any) {
//
//    }
    
}





