//
//  ReflectController.swift
//  LittleBrother
//
//  Created by Eric on 15/11/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
class ReflectController: UIViewController, UIScrollViewDelegate {
    
    var imgView: UIView!
    var label: UILabel!
    var textView: UITextView!
    var submit: UIButton!
    
    let submitHeight: CGFloat = 42
    let left: CGFloat = 10

    override func loadView() {
        let view1 = UIScrollView(frame: Rect(0, 0, ScreenWidth, ScreenHeigh))
        view1.alwaysBounceVertical = true
        view1.showsVerticalScrollIndicator = false
        view1.delegate = self
        view = view1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "意见反馈"
        view.backgroundColor = UIColor.white
    
        imgView = UIView()
        view.addSubview(imgView)
        imgView.layer.contents = #imageLiteral(resourceName: "reflect").cgImage
        imgView.layer.contentsGravity = kCAGravityResizeAspectFill
        // 1281*413
        imgView.snp.makeConstraints{ make in
            //make.width.equalTo(ScreenWidth-2*left)
            make.centerX.width.equalTo(view)
            make.top.equalTo(28)
            make.height.equalTo((ScreenWidth-2*left)*413/1281)
        }
      
        label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19)
        label.text = "您的宝贵意见："
        label.textColor = .black
        label.textAlignment = .center
        view.addSubview(label)
        label.snp.makeConstraints{ make in
            make.centerX.width.equalTo(imgView)
            make.top.equalTo(imgView.snp.bottom).offset(23)
            make.height.equalTo(40)
        }
    
        submit = UIButton()
        view.addSubview(submit)
        submit.setTitle("提交", for: .normal)
        submit.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        
        submit.backgroundColor = Config.themeColor
        submit.clipsToBounds = true
        submit.layer.cornerRadius = submitHeight/2
        submit.snp.makeConstraints{ make in
            make.width.equalTo(138)
            make.height.equalTo(submitHeight)
            make.centerX.equalTo(view)
            make.bottom.equalTo(ScreenHeigh-40-submitHeight)
        }
     
        textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 19.5, weight: .semibold)
        view.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.centerX.equalTo(imgView)
            make.width.equalTo(ScreenWidth-74)
            make.top.equalTo(label.snp.bottom).offset(7)
            make.bottom.equalTo(submit.snp.top).offset(-23)
        }
        textView.textContainerInset = .init(top: 10, left: 9, bottom: 12, right: 9)
        textView.clipsToBounds = true
        textView.returnKeyType = .next
        
        textView.layer.cornerRadius = 20
        textView.layer.borderColor = Config.themeColor.cgColor
        textView.layer.borderWidth = 2
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
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







