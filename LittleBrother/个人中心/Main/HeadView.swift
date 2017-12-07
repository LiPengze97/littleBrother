//
//  HeadView.swift
//  LittleBrother
//
//  Created by Eric on 14/11/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

///1501*790
class HeadView: UIView {
    
    let headImageSize: CGFloat = 78
    let authenticHeight: CGFloat = 28
    var belowButtonHeight: CGFloat = 0
    
    var headImageView: UIImageView?
    var nameLabel: UILabel?
    var authentic: UIButton?
    var backPanel: UIView!
    
    
    var myUpLoad: UIButton?
    var myBill: UIButton?
    
    func fillContents(_ content: Any?) {
        let person = content as? Person
        nameLabel?.text = person?.userName
        authentic?.setTitle(person?.authenStatus.rawValue, for: .normal)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initBasic()
        initHeadImage()
        initNameLabel()
        initAuthenButton()
        initButtons()
        
    }
    func initBasic() {
        belowButtonHeight = bounds.height - ScreenWidth*79/150
        backgroundColor = UIColor.white
        backPanel = UIView()
        addSubview(backPanel)
        backPanel.snp.makeConstraints { make in
            make.left.top.width.equalTo(self)
            make.height.equalTo(ScreenWidth*79/150)
        }
        backPanel.layer.shadowOffset = CGSize(width: 0, height: 3)
        backPanel.layer.shadowColor = UIColor.gray.cgColor
        backPanel.layer.shadowOpacity = 0.3
        
        backPanel.layer.contents = #imageLiteral(resourceName: "nameBackground").cgImage
        backPanel.layer.contentsGravity = kCAGravityResizeAspectFill
        
    }
    
    func initHeadImage() {
        headImageView = UIImageView()
        headImageView?.contentMode = .scaleAspectFill
        headImageView?.layer.cornerRadius = headImageSize/2
        headImageView?.image = #imageLiteral(resourceName: "headPlaceholder")
        headImageView?.clipsToBounds = true
        headImageView?.isUserInteractionEnabled = true
        backPanel.addSubview(headImageView!)
        headImageView?.snp.makeConstraints { make in
            make.centerX.equalTo(backPanel);
            make.width.height.equalTo(headImageSize)
            make.bottom.equalTo(backPanel.snp.centerY).offset(3)
        }
        
    }
    
    func initNameLabel() {
        nameLabel = UILabel()
        backPanel.addSubview(nameLabel!)
        nameLabel?.textAlignment = .center
        nameLabel?.isUserInteractionEnabled = true
        nameLabel?.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        nameLabel?.textColor = Config.themeFontColor
        nameLabel?.text = "未填写"
        nameLabel?.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.centerX.equalTo(backPanel)
            make.top.equalTo(headImageView!.snp.bottom).offset(4)
        }
    }
    
    func initAuthenButton() {
        authentic = UIButton()
        backPanel.addSubview(authentic!)
        authentic?.titleLabel?.textAlignment = .center
        authentic?.titleLabel?.font = UIFont.systemFont(ofSize: 12.5)
        authentic?.setTitleColor(Config.themeFontColor, for: .normal)
        authentic?.layer.cornerRadius = authenticHeight/2
        authentic?.clipsToBounds = true
        authentic?.layer.borderColor = Config.themeFontColor.cgColor
        authentic?.layer.borderWidth = 1.5
        authentic?.setTitle(Authen.NO.rawValue, for: .normal)
        authentic?.snp.makeConstraints { make in
            make.width.equalTo(55)
            make.height.equalTo(authenticHeight)
            make.centerX.equalTo(backPanel)
            make.top.equalTo(nameLabel!.snp.bottom).offset(4)
        }
    }
    
    func initButtons() {
        myUpLoad = UIButton()
        myUpLoad?.setTitle("我的发布", for: .normal)
        myUpLoad?.setTitleColor(UIColor.black, for: .normal)
        addSubview(myUpLoad!)
        myUpLoad?.snp.makeConstraints { make in
            make.left.bottom.equalTo(self)
            make.width.equalTo(ScreenWidth/2)
            make.height.equalTo(belowButtonHeight)
        }
        
        myBill = UIButton()
        myBill?.setTitle("我的抢单", for: .normal)
        myBill?.setTitleColor(UIColor.black, for: .normal)
        addSubview(myBill!)
        myBill?.snp.makeConstraints { make in
            make.right.bottom.equalTo(self)
            make.width.height.equalTo(myUpLoad!)
        }
        
        let seperator1 = UIView()
        seperator1.backgroundColor = UIColor.lightGray
        addSubview(seperator1)
        seperator1.snp.makeConstraints { make in
            make.height.equalTo(belowButtonHeight-20)
            make.width.equalTo(0.5)
            make.left.centerY.equalTo(myBill!)
        }
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}







