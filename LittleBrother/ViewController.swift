//
//  ViewController.swift
//  LittleBrother
//
//  Created by 李鹏泽 on 2017/11/14.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: MainViewController())
        let vc2 = UINavigationController(rootViewController: PhoneRegisterViewController())
        let vc3 = UINavigationController(rootViewController: PersonViewController())
       
       
        viewControllers = [vc1, vc2, vc3]
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//class Test1: UIViewController {
//    
//}

