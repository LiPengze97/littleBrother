//
//  WalletView.swift
//  LittleBrother
//
//  Created by Eric on 14/11/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
class WalletView: UIView {
    
    var labelTitle: UILabel!
    var labelNumber: UILabel!
    
    //632*254
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 5
        clipsToBounds = true
        layer.contents = #imageLiteral(resourceName: "WalletBackground").cgImage
        layer.contentsGravity = kCAGravityResizeAspectFill
        
        labelNumber = UILabel()
        labelNumber.font = UIFont.systemFont(ofSize: 60, weight: .medium)
        addSubview(labelNumber)
        labelNumber.text = "0.00"
        labelNumber.textColor = .white
        labelNumber.textAlignment = .center
        labelNumber.snp.makeConstraints { make in
            make.center.width.equalTo(self)
            make.height.equalTo(65)
        }
        labelTitle = UILabel()
        labelTitle.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        labelTitle.text = "总资产"
        labelTitle.textColor = .white
        labelTitle.textAlignment = .center
        addSubview(labelTitle)
        labelTitle.snp.makeConstraints{ make in
            make.centerX.equalTo(labelNumber)
            make.top.equalTo(10)
            make.width.equalTo(100)
            make.height.equalTo(36)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
