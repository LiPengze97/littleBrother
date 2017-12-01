//
//  ButtonsTableViewCell.swift
//  LittleBrother
//
//  Created by 李鹏泽 on 2017/11/14.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

class ButtonsTableViewCell: UITableViewCell {
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let a = UIButton.init(frame: CGRect.init(x: ScreenWidth/3, y: 0, width: ScreenWidth/3, height: self.frame.height))
        a.tag = 1001
//        a.backgroundColor = UIColor.red
        let b = UIButton.init(frame: CGRect.init(x: ScreenWidth/3 * 2, y: 0, width: ScreenWidth/3, height: self.frame.height))
        b.tag = 1002
//        b.backgroundColor = UIColor.blue

        view1.snp.makeConstraints { (make) in
            make.leadingMargin.equalTo(0)
        }
        view2.snp.makeConstraints { (make) in
            make.size.equalTo(view1)
            make.leadingMargin.equalTo(ScreenWidth/3)
        }
        view3.snp.makeConstraints { (make) in
            make.size.equalTo(view2)
            make.leadingMargin.equalTo(ScreenWidth/3*2)
        }
        self.addSubview(a)
        self.addSubview(b)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
