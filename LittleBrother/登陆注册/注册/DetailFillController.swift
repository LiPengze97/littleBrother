//
//  NameVerifyController.swift
//  打折啦
//
//  Created by Eric on 8/4/17.
//  Copyright © 2017 INGStudio. All rights reserved.
//

import Foundation
import Alamofire

class DetailFillController: SignUpBaseViewController, UIScrollViewDelegate {
    
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
      
        scroll = UIScrollView(frame: Rect(0, 66, ScreenWidth, ScreenHeigh-46))
        scroll.alwaysBounceVertical = true
        scroll.delegate = self
        scroll.showsVerticalScrollIndicator = false
        view.addSubview(scroll)
        scroll.backgroundColor = .white
        scroll.addSubview(textField1!)
        
        backImage.layer.contents = nil
        backImage.backgroundColor = .clear
        let tipLabel = getLabel("完善信息")
        tipLabel.textColor = UIColor.black
        backImage.addSubview(tipLabel)
        tipLabel.textAlignment = .center
        tipLabel.snp.makeConstraints{ make in
            make.centerX.bottom.equalTo(backImage)
            make.width.equalTo(80)
            make.height.equalTo(36)
        }
        backView?.txt.textColor = .black
        backView?.txt.font = UIFont.systemFont(ofSize: 18)
        view.backgroundColor = .white
        
        //头像按钮
        headButton = getButton(headSize)
        headButton.layer.borderWidth = 1
        headButton.imageView?.contentMode = .scaleAspectFill
      
        headmask = UIView()
        headmask.layer.contents = #imageLiteral(resourceName: "camera").cgImage
        headmask.layer.contentsGravity = kCAGravityResizeAspectFill
        scroll.addSubview(headmask)
        headmask.snp.makeConstraints{ make in
            make.centerX.equalTo(scroll)
            make.size.equalTo(45)
            make.top.equalTo(v(40, 51, 64))
        }
        
        scroll.addSubview(headButton)
        headButton.snp.makeConstraints{ make in
            make.center.equalTo(headmask)
            make.size.equalTo(headSize)
        }
        //头像文字提示
        let label1 = UILabel()
        label1.text = "设置头像"
        label1.textColor = UIColor.lightGray
        label1.textAlignment = .center
        scroll.addSubview(label1)
        label1.snp.makeConstraints{ make in
            make.top.equalTo(headButton.snp.bottom).offset(seperator)
            make.width.equalTo(78)
            make.height.equalTo(24)
            make.centerX.equalTo(headButton)
        }
        //昵称文字
        let left: CGFloat = 20
        let label2 = getLabel("昵称")
        scroll.addSubview(label2)
        label2.snp.makeConstraints{ make in
            make.left.equalTo(left)
            make.height.equalTo(25)
            make.width.equalTo(110)
            make.top.equalTo(label1.snp.bottom).offset(seperator)
        }
        
        //昵称输入
        textField1?.font = UIFont.systemFont(ofSize: 18.5)
        textField1?.textAlignment = .left
        
        textField1?.snp.makeConstraints{ make in
            make.left.equalTo(left)
            make.top.equalTo(label2.snp.bottom).offset(-2)
            make.width.equalTo(ScreenWidth-2*left)
            make.height.equalTo(textfieldHei)
        }
        //横线
        let line = UIView()
        line.backgroundColor = UIColor.lightGray
        textField1?.addSubview(line)
        line.snp.makeConstraints{ make in
            make.left.equalTo(-3)
            make.right.equalTo(-20)
            make.height.equalTo(0.5)
            make.bottom.equalTo(textField1!)
        }
        //性别文字
        let label3 = getLabel("性别")
        scroll.addSubview(label3)
        label3.snp.makeConstraints{ make in
            make.left.width.height.equalTo(label2)
            make.top.equalTo(textField1!.snp.bottom).offset(seperator)
        }
        //男女button
        girlButton = RoundButton()
        girlButton.fillImage(corner: 6, borderW: 1.5, img: #imageLiteral(resourceName: "girl_1"))
        scroll.addSubview(girlButton)
        
        girlButton.snp.makeConstraints{ make in
            make.centerX.equalTo(ScreenWidth*0.3)
            make.top.equalTo(label3.snp.bottom).offset(8)
            make.size.equalTo(v(28, 45, 58))
        }
        boyButton = RoundButton()
        boyButton.fillImage(corner: 6, borderW: 1.5, img: #imageLiteral(resourceName: "boy_1"))
        scroll.addSubview(boyButton)
        boyButton.snp.makeConstraints{ make in
            make.centerX.equalTo(ScreenWidth*0.7)
            make.top.size.equalTo(girlButton)
        }
        //学校选择
        let label4 = getLabel("学校选择")
        scroll.addSubview(label4)
        label4.snp.makeConstraints{ make in
            make.left.width.height.equalTo(label3)
            make.top.equalTo(girlButton.snp.bottom).offset(14)
        }
        //学校选择按钮
        
        collegeButton = getButton(textfieldHei)
        collegeButton.layer.borderWidth = 2
        collegeButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 44)
        collegeButton.setTitle("未选择", for: .normal)
        collegeButton.setTitleColor(UIColor.black, for: .normal)
        scroll.addSubview(collegeButton)
        collegeButton.snp.makeConstraints{ make in
            make.left.equalTo(label4).offset(2)
            make.width.equalTo(ScreenWidth*0.45)
            make.height.equalTo(textfieldHei)
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
        scroll.addSubview(label5)
        label5.snp.makeConstraints{ make in
            make.left.equalTo(left)
            make.height.equalTo(25)
            make.width.equalTo(180)
            make.top.equalTo(collegeButton.snp.bottom).offset(5+seperator)
        }
        
        //昵称输入
        inviteTxtfld = UITextField()
        inviteTxtfld.font = UIFont.systemFont(ofSize: 18.5)
        scroll.addSubview(inviteTxtfld)
        inviteTxtfld.snp.makeConstraints{ make in
            make.left.equalTo(left)
            make.top.equalTo(label5.snp.bottom).offset(-2)
            make.width.equalTo(ScreenWidth-2*left)
            make.height.equalTo(textfieldHei)
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
        scroll.addSubview(submit)
        submit.snp.makeConstraints { make in
            make.centerX.equalTo(scroll)
            make.height.equalTo(46)
            make.width.equalTo(141)
            make.bottom.equalTo(ScreenHeigh-90)
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scroll.endEditing(true)
    }
    
//    override func loadView() {
//        let view1 = UIScrollView(frame: Rect(0, 0, ScreenWidth, ScreenHeigh))
//        view1.alwaysBounceVertical = true
//        view1.delegate = self
//        view1.showsVerticalScrollIndicator = false
//        view = view1
//    }

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
    
}




