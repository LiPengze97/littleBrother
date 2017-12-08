//
//  NameVerifyController.swift
//  打折啦
//
//  Created by Eric on 8/4/17.
//  Copyright © 2017 INGStudio. All rights reserved.
//

import Foundation
import Alamofire

class DetailFillController: SignUpBaseViewController, UIScrollViewDelegate, SelectSchoolProtocol {
    
    var scroll: UIScrollView!
    var headButton: UIButton!
    var inviteTxtfld: UITextField!
    var girlButton: RoundButton!
    var boyButton: RoundButton!
    var collegeButton: UIButton!
    var submit: UIButton!
    var headmask: UIView!
    
    let headSize: CGFloat = v(88, 94, 98)
    let textfieldHei: CGFloat = v(36, 40, 44)
    let seperator: CGFloat = v(10, 12, 14)
    
    var school = ""
    /// 在init后就赋值了
    var phone = ""
    var headImage: UIImage?
    
    
    let getButton = { (height: CGFloat) -> UIButton in
        let b = UIButton()
        b.layer.cornerRadius = height/2
        b.clipsToBounds = true
        b.layer.borderColor = Config.themeColor.cgColor
        return b
    }
    let getLabel = { (str: String) -> UILabel in
        let l = UILabel()
        l.textColor = Config.themeColor
        l.text = str
        l.font = UIFont.systemFont(ofSize: 17.5, weight: .semibold)
        return l
    }
    func selectSchool(_ school: String) {
        self.school = school
    }
    
    @objc func submitInfo() {
        let name = textField1?.text
        var gender = nan
        if name == "" || name!.len() > 12 {
            hud.showError(withStatus: "昵称长度错误"); return
        }
        guard Config.predicate(Regex.name, textField1!.text!) else {
            hud.showError(withStatus: "昵称含有非法字符"); return
        }
        if school == "" {
            hud.showError(withStatus: "请选择学校"); return
        }
        if girlButton.status {
            gender = nv
        }
        signUp(gender, name: name!)
    }
    
    func signUp(_ gender: String, name: String) {
        HttpRequest.requestJSON(Router.signUp(name, phone, gender, school, inviteTxtfld.text!)) { _, code, data in
            switch code {
            case 203: hud.showError(withStatus: "邀请码有误")
            case 204: hud.showError(withStatus: "手机号已被注册")
            case 0: self.afterRegister(data: data)
            default: hud.showError(withStatus: "未知错误")
                
            }
        }
    }
    
    func afterRegister(data: JSON) {
        let person = Person(data, toSave: true)
        if headImage != nil {
            //上传头像
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
   
   
    
    
    @objc func valueChanged2() {
        
    }
    
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(valueChanged2), name: .UITextFieldTextDidChange, object: inviteTxtfld)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textField1?.resignFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: .UITextFieldTextDidChange, object: inviteTxtfld)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scroll.endEditing(true)
    }
}




