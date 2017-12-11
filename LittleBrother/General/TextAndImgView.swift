//
//  TextAndImgView.swift
//  LittleBrother
//
//  Created by Eric on 02/12/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
///宽高 58 40
class TextAndImgView: UIView {
    var txt: UILabel!
    var img: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
        txt = UILabel()
        img = UIImageView()
        
        addSubview(img)
        img.contentMode = .scaleAspectFill
        img.snp.makeConstraints { make in
            make.centerY.left.equalTo(self)
            make.height.width.equalTo(18)
        }
        
        txt.textColor = UIColor.black
        txt.textAlignment = .center
        txt.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        addSubview(txt)
        txt.snp.makeConstraints { make in
            make.left.equalTo(img.snp.right)
            make.centerY.height.right.equalTo(self)
        }
    }
    
    func el_setTxtAndImg(_ str: String, img: UIImage) {
        self.img.image = img
        txt.text = str
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
class BackView: UIView {
    
    
    var txt: UILabel!
    var img: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
        txt = UILabel()
        img = UIImageView()
        
        addSubview(img)
        img.contentMode = .scaleAspectFill
        img.image = #imageLiteral(resourceName: "leftArr_1")
        img.snp.makeConstraints { make in
            make.centerY.left.equalTo(self)
            make.height.equalTo(44)
            make.width.equalTo(22)
        }
        
        txt.textColor = UIColor.gray
        txt.textAlignment = .center
        txt.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        txt.text = "返回"
        addSubview(txt)
        txt.snp.makeConstraints { make in
            make.left.equalTo(img.snp.right).offset(-2)
            make.centerY.height.right.equalTo(self)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



