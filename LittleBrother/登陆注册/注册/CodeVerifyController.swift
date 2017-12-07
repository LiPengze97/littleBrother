//
//  CodeVerifyController.swift
//  打折啦
//
//  Created by Eric on 8/4/17.
//  Copyright © 2017 INGStudio. All rights reserved.
//

import Foundation
import Alamofire


class CodeVerifyController: SignUpBaseViewController {
    
    var phone = ""
    var timer:Timer!
    var time = 60 {
        didSet{
            if time == 0 {
                labelSubtitle?.text = "重新发送"
                labelSubtitle?.textColor = Config.systemBlue
                timer.invalidate()
            }else{
                labelSubtitle?.text = "重新发送(\(time))"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMainConstraint(tf: ScreenHeigh/2 - numBoardSmall/2, nxt: 22)
        
        labelTitle = UILabel()
        textField1?.keyboardType = .numberPad
        textField1?.placeholder = ph2
        textField1?.addTitleLabel(labelTitle!)
        addSubtitle()
        
        fire()
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        labelSubtitle?.addGestureRecognizer(tap)
        labelSubtitle?.font = UIFont.systemFont(ofSize: 14.5)
        
    }
    func fire() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @objc func didTap() {
        guard time == 0 else { return }
        labelSubtitle?.textColor = UIColor.lightGray
        time = 60
        
        fire()
    }
    
    @objc func tick() {
        time -= 1
    }
    
    override func addSubtitle() {
        
        labelSubtitle = UILabel()
        labelSubtitle?.isUserInteractionEnabled = true
        labelSubtitle?.textAlignment = .right
        labelSubtitle?.textColor = UIColor.lightGray
        labelSubtitle?.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(labelSubtitle!)
        labelSubtitle?.snp.makeConstraints{ make in
            make.top.equalTo(textField1!.snp.bottom).offset(10)
            make.right.equalTo(textField1!)
            make.height.equalTo(24)
            make.width.equalTo(100)
        }
    }
    
    @objc override func nxt() {
        pushWithoutTabBar(EditPersonController())
        guard nxtValid else { return }
//        hud.show()
//        Alamofire.request(Router.verify(1, value: phone)).validate()
//            .responseJSON{ response in
//                switch response.result {
//                case .failure(let error):
//                    print(dk, error)
//                    hud.showError(withStatus: "验证码错误")
//                case .success:
//                    hud.dismiss()
//                    let nameController = NameVerifyController()
//                    nameController.phone = self.phone
//                    self.navigationController?.pushViewController(nameController, animated: true)
//                }
//        }
    }
    
    @objc override func valueChanged() {
        print("valueChanged func invoked")
        let txtLen = textField1!.text!.len()
        nxtValid = (txtLen >= 4 && txtLen <= 8)
        labelTitle?.text = txtLen == 0 ? "" : ph2
    }
    
    
}




