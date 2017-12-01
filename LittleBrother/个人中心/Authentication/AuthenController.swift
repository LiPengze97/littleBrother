//
//  AuthenController.swift
//  LittleBrother
//
//  Created by Eric on 15/11/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
class AuthenController: UITableViewController, UITextFieldDelegate {
    
    var header: UIView!
    var footer: UIView!
    var card1: CardView!
    var card2: CardView!
    
    var submit: UIButton!
    
    let headerHeight: CGFloat = 220
    let top: CGFloat = 39
    let left: CGFloat = 19
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "校园认证"
        header = UIView(frame: Rect(0, 0, ScreenWidth, headerHeight))
        tableView.tableHeaderView = header
        footer = UIView(frame: Rect(0, 0, ScreenWidth, 200))
        tableView.tableFooterView = footer
        tableView.rowHeight = 49
        
        card1 = CardView()
        header.addSubview(card1)
        card1.initial(isPositive: true)
        card1.snp.makeConstraints{ make in
            make.left.equalTo(left)
            make.width.equalTo(ScreenWidth/2-2*left)
            make.top.equalTo(top)
            make.height.equalTo(headerHeight-2*top)
        }
        card2 = CardView()
        card2.initial(isPositive: false)
        header.addSubview(card2)
        card2.snp.makeConstraints{ make in
            make.size.centerY.equalTo(card1)
            make.right.equalTo(-left)
        }
        
        let buttonHeight: CGFloat = 45
        submit = UIButton()
        submit.setTitle("提交审核", for: .normal)
        submit.setTitleColor(.white, for: .normal)
        submit.backgroundColor = UIColor.lightGray
        submit.layer.cornerRadius = buttonHeight/2
        submit.clipsToBounds = true
        footer.addSubview(submit)
        submit.snp.makeConstraints{ make in
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(buttonHeight)
            make.centerY.equalTo(footer)
        }
        
        //1080*186
        let vi = UIView()
        vi.backgroundColor = UIColor.white
        vi.layer.contents = #imageLiteral(resourceName: "textHolder").cgImage
        vi.layer.contentsGravity = kCAGravityResizeAspectFill
        vi.layer.contentsRect = Rect(-0.05, 0.00, 0.95, 1)
        footer.addSubview(vi)
        
        vi.snp.makeConstraints{ make in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(submit.snp.bottom).offset(18)
            make.height.equalTo(ScreenWidth*186/1080)
        }
        
        
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = RightTextFieldCell()
            cell.setLeftText("真实姓名")
            cell.setRightArgs("输入姓名")
            cell.txfld.delegate = self
            return cell
        } else if indexPath.row == 1 {
            let cell = RightTextFieldCell()
            cell.setLeftText("身份证号")
            cell.txfld.delegate = self
            cell.setRightArgs("输入身份证号", width: ScreenWidth*1.9/3)
            return cell
        }
        let cell = RightLabelCell()
        cell.setLeftText("学校")
        cell.setRightText("选择学校")
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            tableView.cellForRow(at: indexPath)?.setSelected(false, animated: true)
        }
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





