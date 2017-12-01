//
//  LoopTableViewCell.swift
//  CampusRepair
//
//  Created by 李鹏泽 on 16/8/26.
//  Copyright © 2016年 INGSwifters. All rights reserved.
//

import UIKit

class LoopTableViewCell: UITableViewCell {
    @IBOutlet weak var loopView: CircleLoopView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        

}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
