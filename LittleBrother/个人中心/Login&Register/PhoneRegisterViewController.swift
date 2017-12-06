//
//  PhoneRegisterViewController.swift
//  LittleBrother
//
//  Created by 李鹏泽 on 2017/12/4.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PhoneRegisterViewController: UIViewController {

    @IBOutlet weak var infolabel: UILabel!
    @IBOutlet weak var phoneinput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneinput.layer.borderWidth = 3
        phoneinput.layer.borderColor = UIColor.yellow.cgColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextstep(_ sender: Any) {
        //TODO: 加输入验证
        Alamofire.request(Router.getIdentifyCode("18340018998")).responseJSON { (response) in
            print(response.result.value)
        }
        
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
