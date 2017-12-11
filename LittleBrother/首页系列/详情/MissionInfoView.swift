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
    
    ///参数 任务
    func fillContents(_ content: Any?) {
        let m = content as! Mission
        moneyLabel.text = "\(m.price!)元"
        timeLabel.text = m.time.getDaysBefore(true)
        missionTitleLabel.text = m.title
        missionDetailLabel.text = m.description + "  地址: " + m.address
        
     
    }
    
    
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
            make.right.equalTo(-ScreenWidth*0.78)
        }
        
        moneyLabel = UILabel()
        addSubview(moneyLabel)
        moneyLabel.textAlignment = .left
        moneyLabel.snp.makeConstraints { maek in
            maek.left.equalTo(moneyImg.snp.right).offset(2)
            maek.height.equalTo(23)
            maek.centerY.equalTo(moneyImg)
            maek.width.equalTo(0.24*ScreenWidth)
        }
        moneyLabel.text = "0000元"
       
        addSubview(timeImg)
        timeImg.snp.makeConstraints{ make in
            make.right.equalTo(-0.29*ScreenWidth)
            make.size.centerY.equalTo(moneyImg)
        }
    
        timeLabel = UILabel()
        addSubview(timeLabel)
        timeLabel.textAlignment = .left
        timeLabel.snp.makeConstraints{ maek in
            maek.left.equalTo(timeImg.snp.right).offset(5)
            maek.size.centerY.equalTo(moneyLabel)
        }
        timeLabel.text = "abcdeFGH"
        
        missionTitleLabel = UILabel()
        addSubview(missionTitleLabel)
        missionTitleLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
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
        aLabel.font = UIFont.systemFont(ofSize: 15)
        addSubview(aLabel)
        aLabel.snp.makeConstraints{ make in
            make.left.equalTo(20)
            make.width.equalTo(120)
            make.height.equalTo(28)
            make.top.equalTo(missionTitleLabel.snp.bottom).offset(5)
        }
        
        missionDetailLabel = UILabel()
        missionDetailLabel.textColor = UIColor.darkGray
        missionDetailLabel.textAlignment = .left
        missionDetailLabel.numberOfLines = 0
        missionDetailLabel.font = UIFont.systemFont(ofSize: 17)
        addSubview(missionDetailLabel)
        missionDetailLabel.snp.makeConstraints{ make in
            make.left.equalTo(27)
            make.width.equalTo(ScreenWidth-50)
            make.top.equalTo(aLabel.snp.bottom).offset(3)
            make.bottom.equalTo(self).offset(-5)
        }
        missionDetailLabel.text = "测试文字"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
