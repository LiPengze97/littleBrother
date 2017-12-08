//
//  CodeVerifyView.swift
//  LittleBrother
//
//  Created by Eric on 08/12/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit

extension CodeVerifyController {
    
    func specificView() {
        labelTitle = UILabel()
        textField1?.keyboardType = .numberPad
        textField1?.placeholder = ph2
        textField1?.addTitleLabel(labelTitle!)
        addSubtitle()
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        labelSubtitle?.addGestureRecognizer(tap)
        labelSubtitle?.font = UIFont.systemFont(ofSize: 14.5)
        
    }
    
  
    
}
