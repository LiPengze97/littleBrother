//
//  MyOrdersController.swift
//  LittleBrother
//
//  Created by Eric on 15/11/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
import MJCSegmentInterface
import Alamofire
import SwiftyJSON

class MyOrdersController: UIViewController {
    
    var vc1: ItemsController!
    var vc2: ItemsController!
    var segmentView: MJCSegmentInterface!
    
    let segmentTitleHeight: CGFloat = 60
    let titleArr = ["进行中", "已完成"]
    
    func loadData(){
        //进行中
        Alamofire.request(Router.myAcceptTasks("PROCESSING", "0")).responseJSON { (response) in
            switch response.result{
            case .success:
                guard let value = response.result.value else{
                    log("response.result.value is nil", .error)
                    return
                }
                let json = JSON(value)
                print("📺",json)
                
                
                return
            case .failure(let error):
                log(error, .error)
                return
            }
        }
        //已完成
        Alamofire.request(Router.myAcceptTasks("FINISH", "0")).responseJSON { (response) in
            switch response.result{
            case .success:
                guard let value = response.result.value else{
                    log("response.result.value is nil", .error)
                    return
                }
                let json = JSON(value)
                print("📺",json)
                
                
                return
            case .failure(let error):
                log(error, .error)
                return
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "我的抢单"
        vc1 = ItemsController(isMyAccept: true, MissionStatus.PROCESSING)
        vc2 = ItemsController(isMyAccept: true, MissionStatus.FINISH)
        
        segmentView = MJCSegmentInterface(frame: Rect(0, 64, ScreenWidth, ScreenHeigh-64))
        segmentView.titlesViewFrame = Rect(0, 0, ScreenWidth, segmentTitleHeight)
        view.addSubview(segmentView)
        segmentView.intoTitlesArray(titleArr, intoChildControllerArray: [vc1, vc2], hostController: self)
        segmentView.itemTextSelectedColor = Config.themeColor
        segmentView.itemTextNormalColor = .black
        segmentView.indicatorHidden = true
        segmentView.itemTextFontSize = 20
        //segmentView.titleBarStyles = .titlesScrollStyle
        //segmentView.isIndicatorFollow = true
        //segmentView.indicatorColor = Config.themeColor
        
        let vi = UIView(frame: Rect(ScreenWidth/2, 7.5, 0.5, segmentTitleHeight-15))
        vi.backgroundColor = UIColor.lightGray
        segmentView.addSubview(vi)
        let vii = UIView(frame: Rect(5, segmentTitleHeight-0.5, ScreenWidth-10, 0.5))
        vii.backgroundColor = UIColor.lightGray.withAlphaComponent(0.7)
        segmentView.addSubview(vii)
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







