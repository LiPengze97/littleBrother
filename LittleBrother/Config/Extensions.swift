//
//  Extensions.swift
//  LittleBrother
//
//  Created by Eric on 15/11/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func pushWithoutTabBar(_ viewController: UIViewController, animated: Bool = true) {
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: animated)
    }
}

extension UILabel {
    ///使用此方法的前提：已经 make width constraints
    func el_setAutoWidthText(_ str: String, fontSize: CGFloat) {
        let w = autoSize(str, size: fontSize).width
        snp.updateConstraints{ make in
            make.width.equalTo(w+5)
        }
        text = str;
        font = UIFont.systemFont(ofSize: fontSize)
    }
    
    
}

extension String {
    func len() -> Int {
        return NSString(string: self).length
    }
    
}
