//
//  MyReleaseController.swift
//  LittleBrother
//
//  Created by Eric on 15/11/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
import MJCSegmentInterface
class MyReleaseController: UIViewController {
    
    var vc1: ItemsController!
    var vc2: ItemsController!
    var vc3: ItemsController!
    var segmentView: MJCSegmentInterface!
    
    let segmentTitleHeight: CGFloat = 60

    let titleArr = ["未被抢", "进行中", "已完成"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "我的发布"
        vc1 = ItemsController(url: nil)
        vc2 = ItemsController(url: nil)
        vc3 = ItemsController(url: nil)
        
        segmentView = MJCSegmentInterface(frame: Rect(0, 64, ScreenWidth, ScreenHeigh-64))
        segmentView.titlesViewFrame = Rect(0, 0, ScreenWidth, segmentTitleHeight)
        view.addSubview(segmentView)
        segmentView.intoTitlesArray(titleArr, intoChildControllerArray: [vc1, vc2, vc3], hostController: self)
        //segmentView.titleBarStyles = .titlesScrollStyle
        //segmentView.isIndicatorFollow = true
        segmentView.itemTextSelectedColor = Config.themeColor
        segmentView.itemTextNormalColor = .black
        segmentView.indicatorHidden = true
        segmentView.itemTextFontSize = 20
        //segmentView.indicatorColor = Config.themeColor
        
        let vi = UIView(frame: Rect(ScreenWidth/3, 7.5, 0.5, segmentTitleHeight-15))
        vi.backgroundColor = UIColor.lightGray
        segmentView.addSubview(vi)
        
        let vii = UIView(frame: Rect(ScreenWidth*2/3, 7.5, 0.5, segmentTitleHeight-15))
        vii.backgroundColor = UIColor.lightGray
        segmentView.addSubview(vii)
        
        let viii = UIView(frame: Rect(5, segmentTitleHeight-0.5, ScreenWidth-10, 0.5))
        viii.backgroundColor = UIColor.lightGray.withAlphaComponent(0.7)
        segmentView.addSubview(viii)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
}
