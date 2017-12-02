//
//  PersonInfoView.swift
//  LittleBrother
//
//  Created by Eric on 01/12/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit

let headImgHeight: CGFloat = 70

class PersonInfoView: UIView {
    
    var head: WhiteCircleImageView!
    var nameLabel: UILabel!
    var genderImg: UIImageView!
    var universityLabel: UILabel!
    
    var rightArrow: UIImageView?
    
    let nameFontSize: CGFloat = 18
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let borderW: CGFloat = 1.5
        let leftD: CGFloat = 17
        
        head = WhiteCircleImageView()
        addSubview(head)
        head.initialize(border: borderW)
        head.snp.makeConstraints{ make in
            make.left.equalTo(leftD)
            make.centerY.equalTo(self)
            make.width.height.equalTo(headImgHeight+2*borderW)
        }
        head.el_setImage(#imageLiteral(resourceName: "headPlaceholder"))
        
        nameLabel = UILabel()
        nameLabel.text = "NO"
        nameLabel.textColor = UIColor.black
        nameLabel.font = UIFont.systemFont(ofSize: nameFontSize, weight: .medium)
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints{ make in
            make.left.equalTo(head.snp.right).offset(leftD-3)
            make.width.equalTo(20)
            make.height.equalTo(25)
            make.top.equalTo(head).offset(5)
        }
        //nameLabel.el_setAutoWidthText("NULL", fontSize: 18.5)
        
        genderImg = UIImageView()
        genderImg.backgroundColor = UIColor.clear
        genderImg.contentMode = .scaleAspectFit
        addSubview(genderImg)
        genderImg.snp.makeConstraints{ make in
            make.left.equalTo(nameLabel.snp.right).offset(5)
            make.width.height.equalTo(19)
            make.centerY.equalTo(nameLabel)
        }
        genderImg.image = #imageLiteral(resourceName: "boy_1")
        
        universityLabel = UILabel()
        universityLabel.textColor = UIColor.darkGray.withAlphaComponent(0.9)
        universityLabel.font = UIFont.systemFont(ofSize: 16)
        addSubview(universityLabel)
        universityLabel.textAlignment = .left
        universityLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel)
            make.bottom.equalTo(head).offset(-4)
            make.width.equalTo(180)
            make.height.equalTo(20)
        }
        universityLabel.text = "NULL"
        
        //        rightArrow = UIImageView()
        //        rightArrow!.image = UIImage(named: "rightW")
        //        rightArrow!.contentMode = .scaleAspectFit
        //        addSubview(rightArrow!)
        //        rightArrow!.snp.makeConstraints { make in
        //            make.right.equalTo(-12)
        //            make.centerY.equalTo(self)
        //            make.width.equalTo(20)
        //            make.height.equalTo(30)
        //        }
     
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}


class WhiteCircleImageView: UIView {
    
    var imgView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        clipsToBounds = true
        
        imgView = UIImageView()
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = headImgHeight*0.5
        imgView.contentMode = .scaleAspectFill
        addSubview(imgView)
        imgView.snp.makeConstraints{ make in
            make.width.height.equalTo(headImgHeight)
            make.center.equalTo(self)
        }
    }
    
    func initialize(border: CGFloat) {
        layer.cornerRadius = headImgHeight*0.5+border
    }
    
    func el_setImage(_ img: UIImage) {
        imgView.image = img
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
