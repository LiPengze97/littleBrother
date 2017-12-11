//
//  NaviUniversityView.swift
//  LittleBrother
//
//  Created by Eric on 02/12/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
let navTitleHeight: CGFloat = 18
///初始化和获取数据后调用 fillContents
class UniversityView: UIView {
    
    var button: UIButton!
    var university: School!
    
    ///参数: 学校 School
    func fillContents(_ contents: Any?) {
        university = contents as? School ?? School("0", "未选择")
        let w = autoSize(university.name, size: 13).width
        button.snp.updateConstraints{ make in
            make.width.equalTo(w)
        }
        button.setTitle(university.name, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //463*63
        let univerView = UIView()
        let titleW = navTitleHeight*463/63
        univerView.layer.contents = #imageLiteral(resourceName: "univer").cgImage
        univerView.layer.contentsGravity = kCAGravityResizeAspectFill
        addSubview(univerView)
        univerView.snp.makeConstraints{ make in
            make.left.centerY.equalTo(self)
            make.height.equalTo(navTitleHeight)
            make.width.equalTo(titleW)
        }
        
        button = UIButton()
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        addSubview(button)
        //button.contentMode = .bottomLeft
        button.snp.makeConstraints{ make in
            make.left.equalTo(univerView.snp.right).offset(1)
            make.width.equalTo(50)
            make.bottom.equalTo(self)
            make.height.equalTo(18)
        }
        
        //13*9
        let downArrow = UIView()
        downArrow.layer.contents = #imageLiteral(resourceName: "downArr").cgImage
        downArrow.layer.contentsGravity = kCAGravityResizeAspect
        addSubview(downArrow)
        downArrow.snp.makeConstraints { (make) in
            make.left.equalTo(button.snp.right)
            make.centerY.equalTo(button)
            make.width.equalTo(13)
            make.height.equalTo(9)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
