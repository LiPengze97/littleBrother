//
//  PhoneNumberView.swift
//  LittleBrother
//
//  Created by Eric on 08/12/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
extension PhoneNumberController {
    
    func specificView() {
        labelTitle = UILabel()
        textField1?.keyboardType = .numberPad
        textField1?.placeholder = ph1
        textField1?.addTitleLabel(labelTitle!)
        cancelButton.isHidden = true
    }
    
   
    func setupAttributeLabel() {
        let numPadOffSet: CGFloat = v(7, 7, 13)
        bottomLabel = UILabel()
        view.addSubview(bottomLabel!)
        bottomLabel?.snp.makeConstraints{ make in
            make.height.equalTo(20)
            make.width.equalTo(ScreenWidth-50)
            make.bottom.equalTo(-numPadOffSet-numBoardSmall)
            make.centerX.equalTo(ScreenWidth/2)
        }
        
        let str1 = "注册即代表您已阅读并同意使用条款和隐私政策"
        let str1len = str1.len()
        let attStr = NSMutableAttributedString(string: str1)
        attStr.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: 12.5), range: myRange(0,str1len))
        attStr.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.lightGray, range: myRange(0,12))
        attStr.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.blue, range: myRange(12, 4))
        attStr.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.lightGray, range: myRange(16, 1))
        attStr.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.blue, range: myRange(17, 4))
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        attStr.addAttribute(NSAttributedStringKey.paragraphStyle, value: style, range: myRange(0, str1len))
        
        bottomLabel?.attributedText = attStr
        bottomLabel?.enabledTapEffect = false
        bottomLabel?.yb_addAttributeTapAction(with: ["使用条款", "隐私政策"]) {
            (_, _, integer) in
            if integer == 0 {
                self.pushWithoutTabBar(WebViewController())
            } else {
                self.pushWithoutTabBar(WebViewController())
            }
            
        }
    }
 
}
