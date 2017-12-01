//
//  MissionInfoTableViewCell.swift
//  LittleBrother
//
//  Created by 李鹏泽 on 2017/11/15.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

class MissionInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var sexLabel: UIImageView!
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.avatar.layer.masksToBounds = true
        self.avatar.layer.cornerRadius = avatar.frame.width/2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
