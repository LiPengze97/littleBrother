//
//  EditPersonController.swift
//  LittleBrother
//
//  Created by Eric on 16/11/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
class EditPersonController: UIViewController, UIScrollViewDelegate {
    
    let headSize: CGFloat = 95
    
    var headButton: UIButton!
    var textfield: UITextField!
    var inviteTxtfld: UITextField!
    var girlButton: RoundButton!
    var boyButton: RoundButton!
    var collegeButton: UIButton!
    var submit: UIButton!
    var headmask: UIView!
    
    
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
    
    @objc func submitInfo() {
        navigationController?.dismiss(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "完善信息"
        view.backgroundColor = .white
        //头像按钮
        headButton = getButton(headSize)
        headButton.layer.borderWidth = 1
        //headButton.setImage(#imageLiteral(resourceName: "camera"), for: .normal)
        headButton.imageView?.contentMode = .scaleAspectFill
        //headButton.imageEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        
        headmask = UIView()
        headmask.layer.contents = #imageLiteral(resourceName: "camera").cgImage
        headmask.layer.contentsGravity = kCAGravityResizeAspectFill
        view.addSubview(headmask)
        headmask.snp.makeConstraints{ make in
            make.centerX.equalTo(view)
            make.size.equalTo(45)
            make.top.equalTo(44)
        }
        
        view.addSubview(headButton)
        headButton.snp.makeConstraints{ make in
            make.center.equalTo(headmask)
            make.size.equalTo(headSize)
        }
        //头像文字提示
        let label1 = UILabel()
        label1.text = "设置头像"
        label1.textColor = UIColor.lightGray
        label1.textAlignment = .center
        view.addSubview(label1)
        label1.snp.makeConstraints{ make in
            make.top.equalTo(headButton.snp.bottom).offset(10)
            make.width.equalTo(78)
            make.height.equalTo(24)
            make.centerX.equalTo(headButton)
        }
        //昵称文字
        let left: CGFloat = 20
        let label2 = getLabel("昵称")
        view.addSubview(label2)
        label2.snp.makeConstraints{ make in
            make.left.equalTo(left)
            make.height.equalTo(25)
            make.width.equalTo(110)
            make.top.equalTo(label1.snp.bottom).offset(10)
        }
        //昵称输入
        textfield = UITextField()
        textfield.font = UIFont.systemFont(ofSize: 18.5)
        view.addSubview(textfield)
        textfield.snp.makeConstraints{ make in
            make.left.equalTo(left)
            make.top.equalTo(label2.snp.bottom).offset(-2)
            make.width.equalTo(ScreenWidth-2*left)
            make.height.equalTo(40)
        }
        //横线
        let line = UIView()
        line.backgroundColor = UIColor.lightGray
        textfield.addSubview(line)
        line.snp.makeConstraints{ make in
            make.left.equalTo(-3)
            make.right.equalTo(-20)
            make.height.equalTo(0.5)
            make.bottom.equalTo(textfield)
        }
        //性别文字
        let label3 = getLabel("性别")
        view.addSubview(label3)
        label3.snp.makeConstraints{ make in
            make.left.width.height.equalTo(label2)
            make.top.equalTo(textfield.snp.bottom).offset(9)
        }
        //男女button
        girlButton = RoundButton()
        girlButton.fillImage(corner: 6, borderW: 1.5, img: #imageLiteral(resourceName: "girl_1"))
        view.addSubview(girlButton)
        
        girlButton.snp.makeConstraints{ make in
            make.centerX.equalTo(ScreenWidth*0.3)
            make.top.equalTo(label3.snp.bottom).offset(8)
            make.size.equalTo(45)
        }
        boyButton = RoundButton()
        boyButton.fillImage(corner: 6, borderW: 1.5, img: #imageLiteral(resourceName: "boy_1"))
        view.addSubview(boyButton)
        boyButton.snp.makeConstraints{ make in
            make.centerX.equalTo(ScreenWidth*0.7)
            make.top.size.equalTo(girlButton)
        }
        //学校选择
        let label4 = getLabel("学校选择")
        view.addSubview(label4)
        label4.snp.makeConstraints{ make in
            make.left.width.height.equalTo(label3)
            make.top.equalTo(girlButton.snp.bottom).offset(14)
        }
        //学校选择按钮
        let collegeHeight: CGFloat = 40
        collegeButton = getButton(collegeHeight)
        collegeButton.layer.borderWidth = 2
        collegeButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 44)
        collegeButton.setTitle("未选择", for: .normal)
        collegeButton.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(collegeButton)
        collegeButton.snp.makeConstraints{ make in
            make.left.equalTo(label4).offset(2)
            make.width.equalTo(ScreenWidth*0.45)
            make.height.equalTo(collegeHeight)
            make.top.equalTo(label4.snp.bottom).offset(8)
        }
        let downView = UIView()
        downView.layer.contents = #imageLiteral(resourceName: "down").cgImage
        downView.layer.contentsGravity = kCAGravityResizeAspectFill
        collegeButton.addSubview(downView)
        downView.snp.makeConstraints{ make in
            make.right.equalTo(collegeButton).offset(-15)
            make.centerY.equalTo(collegeButton)
            make.width.equalTo(16)
            make.height.equalTo(8)
        }
        
        //邀请码文字
        let label5 = getLabel("邀请码 (选填)")
        view.addSubview(label5)
        label5.snp.makeConstraints{ make in
            make.left.equalTo(left)
            make.height.equalTo(25)
            make.width.equalTo(180)
            make.top.equalTo(collegeButton.snp.bottom).offset(15)
        }
        //昵称输入
        inviteTxtfld = UITextField()
        inviteTxtfld.font = UIFont.systemFont(ofSize: 18.5)
        view.addSubview(inviteTxtfld)
        inviteTxtfld.snp.makeConstraints{ make in
            make.left.equalTo(left)
            make.top.equalTo(label5.snp.bottom).offset(-2)
            make.width.equalTo(ScreenWidth-2*left)
            make.height.equalTo(40)
        }
        //横线
        let line2 = UIView()
        line2.backgroundColor = UIColor.lightGray
        inviteTxtfld.addSubview(line2)
        line2.snp.makeConstraints{ make in
            make.left.equalTo(-3)
            make.right.equalTo(-20)
            make.height.equalTo(0.5)
            make.bottom.equalTo(inviteTxtfld)
        }

        submit = getButton(44)
        submit.setTitleColor(.white, for: .normal)
        submit.backgroundColor = Config.themeColor
        submit.setTitle("完成", for: .normal)
        submit.addTarget(self, action: #selector(submitInfo), for: .touchUpInside)
        view.addSubview(submit)
        submit.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.height.equalTo(46)
            make.width.equalTo(136)
            make.bottom.equalTo(ScreenHeigh-89)
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func loadView() {
        let view1 = UIScrollView(frame: Rect(0, 0, ScreenWidth, ScreenHeigh))
        view1.alwaysBounceVertical = true
        view1.delegate = self
        view1.showsVerticalScrollIndicator = false
        view = view1
    }
}


class RoundButton: UIButton {
    
    var status: Bool = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
    }
    
    func fillImage(corner: CGFloat, borderW: CGFloat = 2, img: UIImage) {
        layer.cornerRadius = corner
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = borderW
        setImage(img, for: .normal)
    }
    
    func changeStatus() {
        status = !status
        if !status {
            layer.borderColor = UIColor.clear.cgColor
        }else{
            layer.borderColor = Config.themeColor.cgColor
            setTitleColor(Config.themeColor, for: .normal)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}







