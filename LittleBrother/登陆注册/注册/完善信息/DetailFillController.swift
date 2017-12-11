//
//  NameVerifyController.swift
//  打折啦
//
//  Created by Eric on 8/4/17.
//  Copyright © 2017 INGStudio. All rights reserved.
//

import Foundation
import Alamofire

class DetailFillController: SignUpBaseViewController {
    
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
    
    var school: School!
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
    
  
    
    @objc func selectCollegeClick() {
        let sele = SelectSchoolController()
        sele.delegate = self
        pushWithoutTabBar(sele)
    }
    
    ///点提交
    @objc func submitInfo() {
        hud.show()
        let name = textField1?.text
        let gender = girlButton.status ? nv : nan
        if name == "" || name!.len() > 12 {
            hud.showError(withStatus: "昵称长度错误"); return
        }
        guard Config.predicate(Regex.name, textField1!.text!) else {
            hud.showError(withStatus: "昵称含有非法字符"); return
        }
        if school == nil {
            hud.showError(withStatus: "请选择学校"); return
        }
        signUp(gender, name: name!)
    }
    
    ///注册行为
    private func signUp(_ gender: String, name: String) {
        HttpRequest.requestJSON(Router.signUp(name, phone, gender, school.id, inviteTxtfld.text!)) { _, code, data in
            switch code {
            case 203: hud.showError(withStatus: "邀请码有误")
            case 204: hud.showError(withStatus: "手机号已被注册")
            case 0: self.afterRegister(data: data)
            default: hud.showError(withStatus: "未知错误")
            }
        }
    }
    
    ///注册成功后的处理
    private func afterRegister(data: JSON) {
        //如果有头像
        if headImage != nil {
            uploadAvatar()
        }
        _ = Person(data, toSave: true)
        //现在本地存了person，直接dismiss后拿出来用
        let completionHandler = (self.navigationController!.viewControllers[0] as! PhoneNumberController).loginDidFinishHandler
        self.navigationController?.dismiss(animated: true, completion: completionHandler)
        
    }
    
    ///上传头像
    private func uploadAvatar() {
        HttpRequest.uploadFile(Router.setUserAvatar, { multi in
            let data = UIImagePNGRepresentation(self.headImage!)
            multi.append(data!, withName: "avatar")
        }, { progress in
            hud.showProgress(Float(progress))
        }) { _, code, _ in
            guard code == 0 else {
                hud.showError(withStatus: "上传失败,正在登陆"); return
            }
            hud.show(withStatus: "上传完成,正在登陆")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    @objc private func valueChanged2() {
        
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
   
}

extension DetailFillController: UIScrollViewDelegate, SelectSchoolDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scroll.endEditing(true)
    }
    
    func selectSchool(_ school: School) {
        self.school = school
        setCollegeButtonTitle(school.name)
    }
}




