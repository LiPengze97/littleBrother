//
//  EditPersonController.swift
//  LittleBrother
//
//  Created by Eric on 16/11/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
class EditPersonController: UIViewController {
    
    let headSize: CGFloat = 74
    
    var headButton: UIButton!
    var textfield: UITextField!
    var girlButton: RoundButton!
    var boyButton: RoundButton!
    var collegeButton: UIButton!
    var submit: UIButton!
    
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
        l.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        return l
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "完善信息"
        view.backgroundColor = .white
        //头像按钮
        headButton = getButton(headSize)
        headButton.layer.borderWidth = 1
        headButton.setImage(#imageLiteral(resourceName: "camera"), for: .normal)
        headButton.imageEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        view.addSubview(headButton)
        headButton.snp.makeConstraints{ make in
            make.centerX.equalTo(view)
            make.height.width.equalTo(headSize)
            make.top.equalTo(33)
        }
        
        //头像文字提示
        let label1 = UILabel()
        label1.text = "设置头像"
        label1.textColor = UIColor.black
        label1.textAlignment = .center
        view.addSubview(label1)
        label1.snp.makeConstraints{ make in
            make.top.equalTo(headButton.snp.bottom).offset(20)
            make.width.equalTo(78)
            make.height.equalTo(25)
            make.centerX.equalTo(headButton)
        }
        //昵称文字
        let left: CGFloat = 20
        let label2 = getLabel("昵称")
        view.addSubview(label2)
        label2.snp.makeConstraints{ make in
            make.left.equalTo(left)
            make.height.equalTo(30)
            make.width.equalTo(110)
            make.top.equalTo(label1.snp.bottom).offset(22)
        }
        //昵称输入
        textfield = UITextField()
        textfield.font = UIFont.systemFont(ofSize: 18.5)
        view.addSubview(textfield)
        textfield.snp.makeConstraints{ make in
            make.left.equalTo(left)
            make.top.equalTo(label2.snp.bottom).offset(15)
            make.width.equalTo(ScreenWidth-2*left)
            make.height.equalTo(44)
        }
        //横线
        let line = UIView()
        line.backgroundColor = Config.themeColor
        textfield.addSubview(line)
        line.snp.makeConstraints{ make in
            make.left.equalTo(-3)
            make.right.equalTo(-20)
            make.height.equalTo(0.5)
            make.bottom.equalTo(textfield).offset(2)
        }
        //性别文字
        let label3 = getLabel("性别")
        view.addSubview(label3)
        label3.snp.makeConstraints{ make in
            make.left.width.height.equalTo(label2)
            make.top.equalTo(textfield.snp.bottom).offset(30)
        }
        //男女button
        girlButton = RoundButton()
        girlButton.fillImage(corner: 3, borderColor: Config.themeColor, borderW: 1.5, img: #imageLiteral(resourceName: "girl_1"))
        view.addSubview(girlButton)
        let left3: CGFloat = 30
        girlButton.snp.makeConstraints{ make in
            make.left.equalTo(left3)
            make.top.equalTo(label3.snp.bottom).offset(5)
            make.size.equalTo(ScreenWidth/2-2*left3)
        }
        boyButton = RoundButton()
        boyButton.fillImage(corner: 3, borderColor: Config.themeColor, borderW: 1.5, img: #imageLiteral(resourceName: "boy_1"))
        view.addSubview(boyButton)
        boyButton.snp.makeConstraints{ make in
            make.right.equalTo(-left3)
            make.top.size.equalTo(girlButton)
        }
        //学校选择
        let label4 = getLabel("学校选择")
        view.addSubview(label4)
        label4.snp.makeConstraints{ make in
            make.left.width.height.equalTo(label3)
            make.top.equalTo(girlButton.snp.bottom).offset(9)
        }
        //学校选择按钮
        let collegeHeight: CGFloat = 46
        collegeButton = getButton(collegeHeight)
        collegeButton.layer.borderWidth = 2
        collegeButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 44)
        collegeButton.setTitle("未选择", for: .normal)
        collegeButton.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(collegeButton)
        collegeButton.snp.makeConstraints{ make in
            make.left.equalTo(left+2)
            make.width.equalTo(ScreenWidth*0.45)
            make.height.equalTo(collegeHeight)
            make.top.equalTo(label4.snp.bottom).offset(15)
        }
        let downView = UIView()
        downView.layer.contents = #imageLiteral(resourceName: "down").cgImage
        downView.layer.contentsGravity = kCAGravityResizeAspectFill
        collegeButton.addSubview(downView)
        downView.snp.makeConstraints{ make in
            make.right.equalTo(collegeButton).offset(-5)
            make.centerY.equalTo(collegeButton)
            make.width.equalTo(30)
            make.height.equalTo(15)
        }
        
        submit = getButton(48)
        submit.setTitleColor(.white, for: .normal)
        submit.backgroundColor = Config.themeColor
        submit.setTitle("完成", for: .normal)
        view.addSubview(submit)
        submit.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.height.equalTo(48)
            make.width.equalTo(120)
            make.bottom.equalTo(view).offset(-60)
        }
        
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
    
    func fillImage(corner: CGFloat, borderColor: UIColor, borderW: CGFloat = 2, img: UIImage) {
        layer.cornerRadius = corner
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderW
        setImage(img, for: .normal)
        
    }
    
    func changeStatus(_ hasImage: Bool = false) {
        status = !status
        if !status {
            setTitleColor(UIColor.lightGray, for: .normal)
            if hasImage {
                layer.borderColor = UIColor.clear.cgColor
            }else {
                layer.borderColor = UIColor.lightGray.cgColor
            }
            tintColor = UIColor.lightGray
        }else{
            layer.borderColor = Config.themeColor.cgColor
            setTitleColor(Config.themeColor, for: .normal)
            tintColor = Config.themeColor
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}







