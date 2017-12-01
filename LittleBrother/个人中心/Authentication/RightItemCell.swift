//
//  RightItemCell.swift
//  LittleBrother
//
//  Created by Eric on 16/11/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//


import Foundation
import UIKit
class RightLabelCell: UITableViewCell {
    
    var rightLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        rightLabel = UILabel()
        rightLabel.textAlignment = .right
        accessoryType = .disclosureIndicator
        addSubview(rightLabel)
        rightLabel.snp.makeConstraints{ m in
            m.right.equalTo(-31)
            m.centerY.height.equalTo(self)
            m.width.equalTo(ScreenWidth*2/3+10)
        }
    }
    ///black, 17 by default
    func setRightText(_ str: String, size: CGFloat = 17, color: UIColor = .black) {
        rightLabel.text = str
        rightLabel.font = UIFont.systemFont(ofSize: size)
        rightLabel.textColor = color
    }
    ///gray by default
    func setLeftText(_ str: String, color: UIColor = .gray) {
        textLabel?.text = str
        textLabel?.textColor = color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class RightTextFieldCell: UITableViewCell {
    
    var txfld: UITextField!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        txfld = UITextField()
        addSubview(txfld)
        txfld.textAlignment = .right
        txfld.snp.makeConstraints{ m in
            m.right.equalTo(-26)
            m.centerY.height.equalTo(self)
            m.width.equalTo(110)
        }
    }
    ///black, 18 by default
    func setRightArgs(_ plhd: String, width: CGFloat = 0, size: CGFloat = 18, color: UIColor = .black) {
        txfld.placeholder = plhd
        txfld.font = UIFont.systemFont(ofSize: size)
        txfld.textColor = color
        if width == 0 {
            return
        }
        txfld.snp.updateConstraints{ remake in
            remake.width.equalTo(width)
        }
    }
    ///gray by default
    func setLeftText(_ str: String, color: UIColor = .gray) {
        textLabel?.text = str
        textLabel?.textColor = color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
