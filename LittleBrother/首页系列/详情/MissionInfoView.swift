//
//  MissionInfoView.swift
//  LittleBrother
//
//  Created by Eric on 01/12/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
class MissionInfoView: UIView {
    
    var moneyLabel: UILabel!
    var timeLabel: UILabel!
    var missionTitleLabel: UILabel!
    var missionDetailLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        let timeImg = UIImageView(image: #imageLiteral(resourceName: "clock"))
        timeImg.contentMode = .scaleAspectFill
        let moneyImg = UIImageView(image: #imageLiteral(resourceName: "money"))
        moneyImg.contentMode = .scaleAspectFill
        
        addSubview(moneyImg)
        moneyImg.snp.makeConstraints{ make in
            make.width.height.equalTo(35)
            make.top.equalTo(self).offset(10)
            make.right.equalTo(-ScreenWidth*0.75)
        }
        
        moneyLabel = UILabel()
        addSubview(moneyLabel)
        moneyLabel.textAlignment = .left
        moneyLabel.snp.makeConstraints { maek in
            maek.left.equalTo(0.25*ScreenWidth).offset(4)
            maek.height.equalTo(23)
            maek.centerY.equalTo(moneyImg)
            maek.width.equalTo(0.25*ScreenWidth)
        }
        moneyLabel.text = "0000"
        
        addSubview(timeImg)
        timeImg.snp.makeConstraints{ make in
            make.right.equalTo(-0.25*ScreenWidth)
            make.size.centerY.equalTo(moneyImg)
        }
        
        timeLabel = UILabel()
        addSubview(timeLabel)
        timeLabel.textAlignment = .left
        timeLabel.snp.makeConstraints{ maek in
            maek.left.equalTo(0.75*ScreenWidth).offset(5)
            maek.size.centerY.equalTo(moneyLabel)
        }
        timeLabel.text = "abcdeFGH"
        
        missionTitleLabel = UILabel()
        missionTitleLabel.textAlignment = .center
        missionTitleLabel.snp.makeConstraints{ make in
            make.width.equalTo(ScreenWidth)
            make.left.equalTo(0)
            make.height.equalTo(75)
            make.top.equalTo(moneyImg.snp.bottom).offset(4)
        }
        missionTitleLabel.text = "ABCDEFG"
        
        let aLabel = UILabel()
        aLabel.textAlignment = .left
        aLabel.text = "任务详情"
        aLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        addSubview(aLabel)
        aLabel.snp.makeConstraints{ make in
            make.left.equalTo(25)
            make.width.equalTo(120)
            make.height.equalTo(28)
            make.top.equalTo(missionTitleLabel.snp.bottom).offset(5)
        }
        
        missionDetailLabel = UILabel()
        missionDetailLabel.textColor = UIColor.darkGray
        missionDetailLabel.textAlignment = .left
        missionDetailLabel.font = UIFont.systemFont(ofSize: 17)
        addSubview(missionDetailLabel)
        missionDetailLabel.snp.makeConstraints{ make in
            make.left.equalTo(aLabel)
            make.width.equalTo(ScreenWidth-50)
            make.top.equalTo(aLabel.snp.bottom).offset(3)
            make.bottom.equalTo(self).offset(-5)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
