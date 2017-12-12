//
//  MainViewCell.swift
//  LittleBrother
//
//  Created by Eric on 02/12/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
class MainViewCell: UITableViewCell {
    
    var head: WhiteCircleImageView!
    var nameLabel: UILabel!
    var genderImg: UIImageView!
    var contentLabel: UILabel!
    var timeLabel: UILabel!
    var moneyLabel: UILabel!
    
    let nameFontSize: CGFloat = 18
    let contentFontSize: CGFloat = 14.5
    let contentMaxSize = Size(ScreenWidth-headImgHeight*1.7, 55)
    
    ///参数：任务对象
    func fillContents(_ content: Any?) {
        guard let mission = content as? Mission else { return }
        nameLabel.el_setAutoWidthText(mission.master.userName, fontSize: nameFontSize)
        if mission.master.gender == "女" {
            genderImg.image = #imageLiteral(resourceName: "nv")
        }
        head.el_setImage(mission.master.id)
        contentLabel.el_setAutoWidthText(mission.title, fontSize: contentFontSize, max: contentMaxSize)
        
        timeLabel.text = mission.time.getDaysBefore()
       
        moneyLabel.text = "¥\(mission.price!)"
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let borderW: CGFloat = 0.5
        let leftD: CGFloat = 17
        
        head = WhiteCircleImageView()
        addSubview(head)
        head.initialize(border: borderW)
        head.snp.makeConstraints{ make in
            make.left.equalTo(leftD)
            make.top.equalTo(self).offset(10)
            make.width.height.equalTo(headImgHeight+2*borderW)
        }
        head.el_setImage(UIImage(named: "headPlaceholder")!)
        
        nameLabel = UILabel()
        nameLabel.text = "NO"
        nameLabel.textColor = UIColor.black
        nameLabel.font = UIFont.systemFont(ofSize: nameFontSize, weight: .semibold)
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints{ make in
            make.left.equalTo(head.snp.right).offset(leftD-3)
            make.width.equalTo(50)
            make.height.equalTo(22)
            make.top.equalTo(head)
        }
        //nameLabel.el_setAutoWidthText("NULL", fontSize: 18.5)
        
        genderImg = UIImageView()
        genderImg.backgroundColor = UIColor.clear
        genderImg.contentMode = .scaleAspectFill
        addSubview(genderImg)
        genderImg.snp.makeConstraints{ make in
            make.left.equalTo(nameLabel.snp.right).offset(5)
            make.width.height.equalTo(16)
            make.centerY.equalTo(nameLabel)
        }
        genderImg.image = #imageLiteral(resourceName: "nan")
        
        timeLabel = UILabel()
        timeLabel.font = UIFont.systemFont(ofSize: 13)
        timeLabel.textColor = UIColor.lightGray
        timeLabel.textAlignment = .right
        addSubview(timeLabel)
        timeLabel.snp.makeConstraints { (make) in
            make.right.equalTo(-15)
            make.height.equalTo(18)
            make.top.equalTo(head).offset(2)
            make.width.equalTo(80)
        }
        timeLabel.text = "14小时前"
        
        moneyLabel = UILabel()
        moneyLabel.font = UIFont.systemFont(ofSize: 20.5, weight: .semibold)
        moneyLabel.textAlignment = .right
        addSubview(moneyLabel)
        moneyLabel.snp.makeConstraints { (make) in
            make.right.equalTo(timeLabel)
            make.centerY.equalTo(head.snp.bottom).offset(2)
            make.width.equalTo(200)
            make.height.equalTo(34)
        }
        moneyLabel.text = "¥105"
        
        
        contentLabel = UILabel()
        contentLabel.numberOfLines = 0
        contentLabel.textColor = UIColor.darkGray
        contentLabel.font = UIFont.systemFont(ofSize: contentFontSize)
        addSubview(contentLabel)
        contentLabel.textAlignment = .left
       
        contentLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(1)
            make.width.equalTo(contentMaxSize.width)
            make.height.equalTo(24)
        }
        contentLabel.text = "NULLNULLLLLL"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
