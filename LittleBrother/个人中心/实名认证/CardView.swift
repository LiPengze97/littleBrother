//
//  CardView.swift
//  LittleBrother
//
//  Created by Eric on 15/11/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
class CardView: UIView {
    
    var desclabel: UILabel!
    var imgView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        let cardWidth = ScreenWidth/2-2*22
        let imgHeight = cardWidth*308/480
        
        imgView = UIView()
        imgView.isUserInteractionEnabled = true
        imgView.layer.contentsGravity = kCAGravityResizeAspectFill
        addSubview(imgView)
        imgView.snp.makeConstraints{ make in
            make.width.centerX.equalTo(self)
            make.height.equalTo(imgHeight)
            make.top.equalTo(0)
        }
        
        desclabel = UILabel()
        desclabel.textColor = UIColor.lightGray
        desclabel.font = UIFont.systemFont(ofSize: 13)
        desclabel.textAlignment = .center
        addSubview(desclabel)
        desclabel.snp.makeConstraints{ make in
            make.width.centerX.equalTo(imgView)
            make.top.equalTo(imgView.snp.bottom).offset(4)
            make.height.equalTo(28)
        }
        
    }
    
    func initial(isPositive: Bool) {
        if isPositive {
            imgView.layer.contents = #imageLiteral(resourceName: "card_+").cgImage
            desclabel.text = "校园卡正面"
        } else {
            imgView.layer.contents = #imageLiteral(resourceName: "card_-").cgImage
            desclabel.text = "校园卡背面"
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}





