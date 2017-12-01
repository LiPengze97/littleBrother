//
//  WalletController.swift
//  LittleBrother
//
//  Created by Eric on 14/11/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
class WalletController: UIViewController {
    
    var walletView: WalletView!
    var inButton: UIButton!
    var outButton: UIButton!
    
    let buttonHeight: CGFloat = 50
    let left: CGFloat = 20
    
    
    override func loadView() {
        let view1 = UIScrollView(frame: Rect(0, 0, ScreenWidth, ScreenHeigh))
        view1.alwaysBounceVertical = true
        view1.showsVerticalScrollIndicator = false
        view = view1
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    override func viewDidLoad() {
        title = "我的钱包"
        view.backgroundColor = UIColor.white
        walletView = WalletView()
        view.addSubview(walletView)
        walletView.snp.makeConstraints { make in
            make.left.equalTo(left)
            make.width.equalTo(ScreenWidth-2*left)
            make.top.equalTo(25)
            make.height.equalTo((ScreenWidth-2*left)*254/632)
        }
        
        inButton = UIButton()
        outButton = UIButton()
        view.addSubview(inButton)
        inButton.snp.makeConstraints{ make in
            make.centerX.equalTo(ScreenWidth*0.25)
            make.top.equalTo(walletView.snp.bottom).offset(40)
            make.width.equalTo(ScreenWidth*0.365)
            make.height.equalTo(buttonHeight)
        }
        view.addSubview(outButton)
        outButton.snp.makeConstraints{ make in
            make.centerX.equalTo(ScreenWidth*0.75)
            make.top.size.equalTo(inButton)
        }
        
        inButton.setTitle("充值", for: .normal)
        outButton.setTitle("提现", for: .normal)
        inButton.setTitleColor(UIColor.black, for: .normal)
        outButton.setTitleColor(.black, for: .normal)
        inButton.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        outButton.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        inButton.layer.cornerRadius = buttonHeight/2
        inButton.layer.borderColor = UIColor.darkGray.cgColor
        inButton.layer.borderWidth = 1
        outButton.layer.cornerRadius = buttonHeight/2
        outButton.layer.borderColor = UIColor.darkGray.cgColor
        outButton.layer.borderWidth = 1
   
    }
    
}






