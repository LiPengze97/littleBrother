//
//  3ButtonView.swift
//  LittleBrother
//
//  Created by Eric on 02/12/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
class ThreeButtonView: UIView {
    var around: TextAndImgView!
    var post: TextAndImgView!
    var my: TextAndImgView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.around = TextAndImgView()
        self.post = TextAndImgView()
        self.my = TextAndImgView()
        addSubview(around)
        addSubview(post)
        addSubview(my)
        let dataArr = ["附近任务", "发布任务", "我的抢单"]
        around.el_setTxtAndImg(dataArr[0], img: #imageLiteral(resourceName: "around"))
        post.el_setTxtAndImg(dataArr[1], img: #imageLiteral(resourceName: "write"))
        my.el_setTxtAndImg(dataArr[2], img: #imageLiteral(resourceName: "clock_a"))
        around.snp.makeConstraints{ make in
            make.centerX.equalTo(ScreenWidth/6)
            make.centerY.equalTo(self)
            make.height.equalTo(30)
            make.width.equalTo(ScreenWidth/3-35)
        }
        post.snp.makeConstraints{ make in
            make.centerX.equalTo(ScreenWidth/2)
            make.height.width.centerY.equalTo(around)
        }
        my.snp.makeConstraints{ make in
            make.centerX.equalTo(ScreenWidth*5/6)
            make.size.centerY.equalTo(around)
        }
        
        let v = UIView(frame: Rect(ScreenWidth/3, 0, 0.5, threeButtonHeight))
        v.backgroundColor = UIColor.lightGray.withAlphaComponent(0.77)
        addSubview(v)
        let v1 = UIView(frame: Rect(ScreenWidth*2/3, 6, 0.5, threeButtonHeight-12))
        v1.backgroundColor = UIColor.lightGray.withAlphaComponent(0.77)
        addSubview(v1)
        let v2 = UIView(frame: Rect(ScreenWidth/3, threeButtonHeight-0.5, ScreenWidth*2/3-10, 0.5))
        v2.backgroundColor = UIColor.lightGray.withAlphaComponent(0.7)
        addSubview(v2)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
