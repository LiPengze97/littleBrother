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
    
    func reLogin(_ loginDidFinishHandler: (() -> Void)?) {
        let signIn = PhoneNumberController()
        let p = (userDefault.getCustomObj(for: kCurrentUserKey) as? Person)?.mobile
        if p != nil {
            signIn.phone = p!
        }
        signIn.loginDidFinishHandler = loginDidFinishHandler
        present(UINavigationController(rootViewController: signIn), animated: true)
    }
    
    
}

extension UILabel {
    ///调用这个方法实现文字自适应长度
    ///使用此方法的前提：已经 make width constraints
    func el_setAutoWidthText(_ str: String, fontSize: CGFloat, max: CGSize = Size(200, 25)) {
        let s = autoSize(str, size: fontSize, maxSize: max)
        let w = s.width
        let h = s.height
        snp.updateConstraints{ make in
            make.width.equalTo(w+3)
            make.height.equalTo(h+3)
        }
        text = str;
        font = UIFont.systemFont(ofSize: fontSize)
    }
}


extension UIView {

    func addTapGest(target: Any?, action: Selector?) {
        isUserInteractionEnabled = true
        let ges = UITapGestureRecognizer(target: target, action: action)
        addGestureRecognizer(ges)
    }
    
    func addBottomLine(height: CGFloat = 0.75, color: UIColor = UIColor.lightGray, bottom: CGFloat = 1000, left: CGFloat = 0) {
        let separator = UIView()
        if color.cgColor.alpha == 1 {
            separator.backgroundColor = color.withAlphaComponent(0.6)
        }else {
            separator.backgroundColor = color
        }
        addSubview(separator)
        separator.snp.makeConstraints{ (make) in
            make.left.equalTo(left)
            make.right.equalTo(-left)
            make.height.equalTo(height)
            guard bottom != 1000 else {
                make.bottom.equalTo(self); return
            }
            make.bottom.equalTo(bottom)
            
        }
    }
    func setBackgroundImage(named img: String){
        layer.contents = UIImage(named: img)?.cgImage
        layer.contentsGravity = kCAGravityResizeAspectFill
    }
}

extension UITextField {
    
    func psdMod() {
        placeholder = "请输入密码"
        isSecureTextEntry = true
        clearsOnBeginEditing = false
        clearButtonMode = .whileEditing
        keyboardType = .asciiCapable
        autocorrectionType = .no
    }
    
    func addTitleLabel(_ label: UILabel, _ ofSize: CGFloat = 17) {
        label.textAlignment = .center
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: ofSize)
        addSubview(label)
        label.snp.makeConstraints{ make in
            make.bottom.equalTo(self.snp.top).inset(4)
            make.centerX.width.equalTo(self)
            make.height.equalTo(30)
        }
    }
 
    func addConstraintY(centerY: CGFloat, right: CGFloat) {
        snp.makeConstraints{ (make) in
            make.height.equalTo(45)
            make.left.equalTo(right)
            make.right.equalTo(-right)
            make.centerY.equalTo(centerY)
        }
    }
    
}

extension String {

    ///得到string的长度
    func len() -> Int {
        return NSString(string: self).length
    }

    func getDaysBefore(_ withDescribe: Bool = true) -> String {
        
        let seconds = Date().timeIntervalSince1970 - (Double(self) ?? 0)
        let hour = Int64(seconds)/3600
        if hour == 0 {
            if withDescribe{ return "刚刚发布"}
            else { return "刚刚" }
        }else if hour < 24 {
            return "\(hour)小时前"
        }else if hour < 24*30 {
            return "\(hour/24)天前"
        }else if hour < 24*30*12 {
            return "\(hour/720)月前"
        }else {
            return "\(hour/(720*12))年前"
        }
        
    }

}

extension UserDefaults {
    
    ///存储 自定义对象：
    func saveCustomObj(_ obj: NSCoding, key: String){
        
        let encodedObj = NSKeyedArchiver.archivedData(withRootObject: obj)
        set(encodedObj, forKey: key)
        log("Has saved a custom obj ")
        synchronize()
        
    }
    ///获取 自定义对象：
    func getCustomObj(for key: String) -> Any? {
        
        guard let decodedObj = object(forKey: key) as? Data else{ return nil }
        log("Got a local obj")
        return NSKeyedUnarchiver.unarchiveObject(with: decodedObj)
        
    }
    ///存储基本数据类型
    func saveBasic(_ value: Any?, key: String) {
        set(value, forKey: key)
        synchronize()
    }
    
}
