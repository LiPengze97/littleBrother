//
//  SignInVIew.swift
//  打折啦
//
//  Created by Eris on 2017/8/15.
//  Copyright © 2017年 INGStudio. All rights reserved.
//

import Foundation
import UIKit

extension SignInViewController {
    
    func setupView() {
        let height: CGFloat = 45
        ///txtfd
        let left1: CGFloat = 40
        
        let width1: CGFloat = 70
        let height1: CGFloat = 21
        let rad: CGFloat = 46
        let lineH: CGFloat = 1
        let font = UIFont.systemFont(ofSize: 21)
        
        //MARK: - setup views of cancel,head
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor.white
//        view.layer.contents = #imageLiteral(resourceName: "launch").cgImage
        view.layer.contentsGravity = kCAGravityResizeAspect
        
        cancelButton = UIButton()
        cancelButton.setTitleColor(Config.systemBlue, for: .normal)
        cancelButton.setTitle("取消", for: .normal)
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(cancelButton)
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        cancelButton.snp.makeConstraints{ make in
            make.left.equalTo(0)
            make.top.equalTo(25)
            make.height.equalTo(30)
            make.width.equalTo(75)
        }
        
        
        
        //MARK: - setup views of tf1, 展示账户, tf2
        //以手机位置为参考
        accountField = UITextField()
        accountField.placeholder = "手机/会员名/邮箱"
        accountField.clearButtonMode = .whileEditing
        accountField.tag = 200
        accountField.textAlignment = .center
        accountField.font = font
        accountField.returnKeyType = .next
        accountField.delegate = self
        view.addSubview(accountField)
        accountField.snp.makeConstraints{ (make) in
            make.height.equalTo(height)
            make.left.equalTo(left1)
            make.right.equalTo(-left1)
            txtfConstr = make.top.equalTo(ScreenHeigh*standard).constraint
        }
        
     
        
        accountField.addBottomLine(height: lineH, color: UIColor.lightGray)
        
        headImgView = UIImageView()
        headImgView.layer.cornerRadius = rad
        headImgView.layer.masksToBounds = true
        headImgView.image = #imageLiteral(resourceName: "headPlaceholder")
        view.addSubview(headImgView)
        headImgView.snp.makeConstraints{ (make) in
            make.width.height.equalTo(rad*2)
            make.centerX.equalTo(view)
            headConstr = make.centerY.equalTo(ScreenHeigh*standard/2).constraint
        }
        
        //以 accountField 为参考
        psdField = UITextField()
        psdField.psdMod()
        psdField.textAlignment = .center
        psdField.tag = 201
        psdField.font = font
        psdField.delegate = self
        psdField.returnKeyType = .go
        view.addSubview(psdField)
        psdField.snp.makeConstraints{ (make) in
            make.top.equalTo(accountField.snp.bottom)
            make.size.centerX.equalTo(accountField)
        }
        psdField.addBottomLine(height: lineH, color: UIColor.lightGray)
        
        //MARK: - setup views of login,new,forget
        //以 psdField 为参考
        loginButton = UIButton()
        loginButton.layer.cornerRadius = 5
        loginButton.clipsToBounds = true
        loginButton.setTitle("登陆", for: .normal)
        loginButton.backgroundColor = Config.themeColor.withAlphaComponent(0.85)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints{ (make) in
            make.left.right.equalTo(accountField)
            make.height.equalTo(39)
            signConstr = make.top.equalTo(psdField.snp.bottom).offset(height2).constraint
        }
        //以屏幕参考
        newButton = UIButton()
        newButton.setTitle("新用户注册", for: .normal)
        newButton.setTitleColor(Config.systemBlue, for: .normal)
        newButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        newButton.addTarget(self, action: #selector(new), for: .touchUpInside)
        view.addSubview(newButton)
        newButton.snp.makeConstraints{ make in
            make.left.equalTo(loginButton)
            make.top.equalTo(loginButton.snp.bottom).offset(7)
            make.height.equalTo(height1)
            make.width.equalTo(width1+5)
        }
        
        forgetButton = UIButton()
        forgetButton.setTitle("无法登陆?", for: .normal)
        forgetButton.setTitleColor(Config.systemBlue, for: .normal)
        forgetButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        forgetButton.titleLabel?.textAlignment = .right
        forgetButton.addTarget(self, action: #selector(forget), for: .touchUpInside)
        view.addSubview(forgetButton)
        forgetButton.snp.makeConstraints{ make in
            make.right.equalTo(loginButton)
            make.top.equalTo(loginButton.snp.bottom).offset(6)
            make.height.equalTo(height1)
            make.width.equalTo(width1)
        }
   
    }

}



