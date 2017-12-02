//
//  DetailViewController.swift
//  LittleBrother
//
//  Created by Eric on 01/12/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
class DetailViewController: UIViewController {
    
    var personInfoView: PersonInfoView!
    var missionInfoView: MissionInfoView!
    var getButton: UIButton!
    var msgButton: UIButton!
    
    let buttonHeight: CGFloat = 50
    let buttonBottom: CGFloat = 22
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "任务详情"
    
        initPersonView()
        
        initButtomButtons()

        initMissionView()
        
        //MARK: - 如果自己看到，就为true
        let isSelf = false
        getButton.isHidden = isSelf
        msgButton.isHidden = isSelf
        
    }
}



//View:
extension DetailViewController {
    
    func initPersonView() {
        personInfoView = PersonInfoView()
        view.addSubview(personInfoView)
        personInfoView.snp.makeConstraints{ make in
            make.left.equalTo(0)
            make.width.equalTo(ScreenWidth)
            make.height.equalTo(headImgHeight+2)
            make.top.equalTo(20)
        }
    }
    
    func initMissionView() {
        missionInfoView = MissionInfoView()
        view.addSubview(missionInfoView)
        missionInfoView.snp.makeConstraints { make in
            make.left.width.equalTo(personInfoView)
            make.top.equalTo(personInfoView.snp.bottom).offset(17)
            make.bottom.equalTo(getButton.snp.top).offset(-17)
        }
    }
    
    func initButtomButtons() {
        getButton = UIButton()
        msgButton = UIButton()
        view.addSubview(getButton)
        getButton.snp.makeConstraints{ make in
            make.centerX.equalTo(ScreenWidth*0.25)
            make.bottom.equalTo(ScreenHeigh-buttonBottom-90)
            make.width.equalTo(ScreenWidth*0.365)
            make.height.equalTo(buttonHeight)
        }
        view.addSubview(msgButton)
        msgButton.snp.makeConstraints{ make in
            make.centerX.equalTo(ScreenWidth*0.75)
            make.bottom.size.equalTo(getButton)
        }
        
        getButton.setTitle("抢单", for: .normal)
        msgButton.setTitle("私信", for: .normal)
        getButton.setTitleColor(UIColor.white, for: .normal)
        msgButton.setTitleColor(Config.themeColor, for: .normal)
        getButton.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        msgButton.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        getButton.layer.cornerRadius = buttonHeight/2
        msgButton.layer.cornerRadius = buttonHeight/2
        msgButton.layer.borderColor = Config.themeColor.cgColor
        msgButton.layer.borderWidth = 1
        getButton.backgroundColor = Config.themeColor
    }
    
    
    
    override func loadView() {
        let view1 = UIScrollView(frame: Rect(0, 0, ScreenWidth, ScreenHeigh))
        view1.alwaysBounceVertical = true
        view1.showsVerticalScrollIndicator = false
        view = view1
    }
    
}




