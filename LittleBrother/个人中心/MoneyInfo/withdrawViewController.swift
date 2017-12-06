//
//  withdrawViewController.swift
//  LittleBrother
//
//  Created by 李鹏泽 on 2017/12/4.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

class withdrawViewController: UIViewController {

    @IBOutlet weak var withdrawBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        withdrawBtn.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
